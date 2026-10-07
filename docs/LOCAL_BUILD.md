# Build locally

Use Ruby 3.3.5 (see `.ruby-version`) and Bundler. Run `ruby -v` first; this Mac's system Ruby 2.6 is too old, so select Ruby 3.3.5 with your Ruby version manager.

If the build reports `invalid byte sequence in US-ASCII`, run `export LC_ALL=en_US.UTF-8` in that terminal before building.

From the repository root:

```bash
bundle install
bundle exec jekyll build
ruby test/check_site.rb
```

The compiled site is in `_site/`. To preview it with automatic rebuilds, run:

```bash
bundle exec jekyll serve
```

Open <http://localhost:4000/>. Restart the server after changing `_config.yml`. The custom domain uses an empty `baseurl`, so no `/theo-archives` path or build flag is needed.
