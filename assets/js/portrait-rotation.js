(() => {
  const button = document.querySelector('.portrait-frame[data-photo-second]');
  if (!button) return;

  const layers = Array.from(button.querySelectorAll('.portrait-photo'));
  const photos = [layers[0].src, button.dataset.photoSecond, button.dataset.photoThird];
  const preloads = photos.map(() => new Image());
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
  const fadeDuration = 200;
  const rotationDelay = 8000;
  let currentLayer = 0;
  let currentPhoto = 0;
  let changing = false;
  let rotationTimer;

  function scheduleRotation() {
    window.clearTimeout(rotationTimer);
    if (document.hidden || reducedMotion.matches) return;
    rotationTimer = window.setTimeout(() => {
      showNextPhoto();
      scheduleRotation();
    }, rotationDelay);
  }

  async function showNextPhoto() {
    if (changing) return;
    changing = true;

    const nextPhoto = (currentPhoto + 1) % photos.length;
    const preload = preloads[nextPhoto];
    if (!preload.src) preload.src = photos[nextPhoto];

    try {
      if (preload.decode) {
        await preload.decode();
      } else if (!preload.complete) {
        await new Promise((resolve, reject) => {
          preload.onload = resolve;
          preload.onerror = reject;
        });
      }
    } catch {
      changing = false;
      return;
    }

    const incomingLayer = 1 - currentLayer;
    const outgoing = layers[currentLayer];
    const incoming = layers[incomingLayer];
    incoming.src = photos[nextPhoto];
    incoming.style.zIndex = '1';
    outgoing.style.zIndex = '0';
    incoming.classList.add('is-visible');

    window.setTimeout(() => {
      outgoing.classList.remove('is-visible');
      currentLayer = incomingLayer;
      currentPhoto = nextPhoto;
      changing = false;
    }, reducedMotion.matches ? 0 : fadeDuration + 40);
  }

  button.addEventListener('click', () => {
    showNextPhoto();
    scheduleRotation();
  });
  window.addEventListener('load', () => {
    if (!preloads[1].src) preloads[1].src = photos[1];
    if (!preloads[2].src) preloads[2].src = photos[2];
  }, { once: true });
  document.addEventListener('visibilitychange', scheduleRotation);
  reducedMotion.addEventListener('change', scheduleRotation);
  scheduleRotation();
})();
