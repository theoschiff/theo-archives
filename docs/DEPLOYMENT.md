# GitHub Pages setup

The target repository is `theoschiff/theo-archives`; the public URL is `https://theoschifferli.ch`. The repository description to set in GitHub is `research, work and sidequests`.

1. Push this repository's `main` branch to `github.com/theoschiff/theo-archives` when you are ready.
2. In the repository's **Settings → Pages**, choose **GitHub Actions** as the build and deployment source. The `Publish portfolio` workflow will build and deploy after every later push to `main`.
3. In the same Pages settings, set the **Custom domain** to `theoschifferli.ch`. Do this before pointing DNS at GitHub Pages. Turn on **Enforce HTTPS** after the certificate becomes available.
4. At your DNS provider, add apex `A` records for `185.199.108.153`, `185.199.109.153`, `185.199.110.153` and `185.199.111.153`. An `ALIAS` or `ANAME` pointing to `theoschiff.github.io` is also supported if your provider offers it. If you want `www`, add a `CNAME` from `www.theoschifferli.ch` to `theoschiff.github.io`.
5. Check the Actions tab for a successful `Publish portfolio` run, then visit `https://theoschifferli.ch`. DNS and HTTPS can take time to settle.

With a custom Actions workflow, the domain must be set in repository Pages settings; GitHub Pages does not use a repository `CNAME` file for this publishing method. See [GitHub's Pages workflow guide](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages) and [custom-domain guide](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site).
