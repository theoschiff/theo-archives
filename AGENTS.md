# Site guidance for coding agents

This repository is Théo Schifferli's personal site, based on the al-folio v1 starter. It is served by GitHub Pages at `https://theoschifferli.ch/`. Read [`README.md`](README.md) and [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md) before changing the site or its publishing workflow.

## Where to change things

- `_config.yml`: identity, domain, navigation, accent colour, feature flags and plugin activation. Keep its plugin list in sync with `Gemfile`.
- `_pages/`: the six public sections and 404 page. Keep their URLs stable unless requested.
- `_data/research.yml` and `_data/sidequests.yml`: research and curated sidequest entries.
- `assets/cv/TS_CV.pdf`: the original CV, which is the source for biographical claims. Do not infer publications, projects or links absent from this source.
- `assets/img/favicon/doodle-portrait-favicon.png`: the doodle favicon; `assets/img/portrait/TSchifferli_cropped.jpg`: the About-page photograph.
- `_layouts/portfolio.liquid` and `assets/css/portfolio.css`: intentional site-specific presentation. This is a personal site and may own local presentation; shared changes to al-folio belong in its gems.
- `.github/workflows/pages.yml`: GitHub Pages build and deployment. Never push or deploy unless the user asks.

## Checks

Run `bundle install`, `bundle exec jekyll build`, and `ruby test/check_site.rb` when the Ruby toolchain is available. The Pages workflow runs the build and site check on every push to `main`. The custom domain uses an empty `baseurl`; do not add `/theo-archives` to links or builds.

The site has deliberately few dependencies. Add a plugin only when a real portfolio feature needs it; make the corresponding `Gemfile` and `_config.yml` edits together. Keep Sidequests empty until the user supplies projects to curate.
