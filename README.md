# Théo Schifferli

Research, work and sidequests at [theoschifferli.ch](https://theoschifferli.ch). This is a small Jekyll portfolio based on al-folio v1. The main entry point is [`_config.yml`](_config.yml); the site-specific layout and CSS live in `_layouts/portfolio.liquid` and `assets/css/portfolio.css`.

The six sections are About, Research, Publications, Code, CV and Sidequests. The About page displays [`assets/img/portrait/TSchifferli_cropped.jpg`](assets/img/portrait/TSchifferli_cropped.jpg); the doodle remains the favicon. The CV page embeds [`assets/cv/TS_CV.pdf`](assets/cv/TS_CV.pdf), with direct open and download links. Sidequests is intentionally empty; add curated entries to [`_data/sidequests.yml`](_data/sidequests.yml) when they are ready. Research entries live in [`_data/research.yml`](_data/research.yml).

## Preview locally

Follow the commands in [`docs/LOCAL_BUILD.md`](docs/LOCAL_BUILD.md). Local previews show “Last updated: local preview”; the Pages workflow sets the actual push date for published builds.

## Publish

The workflow in [`.github/workflows/pages.yml`](.github/workflows/pages.yml) builds on every push to `main` and publishes to GitHub Pages. It has no separate `gh-pages` branch and needs no local deploy command. To finish the one-time GitHub and DNS setup, follow [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md). Nothing in this repository pushes automatically from your machine.
