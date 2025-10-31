# Documentation Website Deployment Guide

Your beautiful documentation website is ready! Here's how to deploy it.

## What You Have

A professional documentation website built with **MkDocs Material**:

- Modern, responsive design
- Dark/light mode toggle
- Built-in search
- Mobile-friendly
- Fast and lightweight

## Preview Locally

```bash
cd /Users/drodriguez/src/zed-nix

# Start development server (with live reload)
python3 -m mkdocs serve

# Open browser to:
# http://127.0.0.1:8000
```

The server will auto-reload when you edit `.md` files!

---

## Deployment Options

### Option 1: GitHub Pages (Recommended - FREE!)

Perfect for open source projects. Automatic deployment.

#### Setup Steps

1. **Push your code to GitHub** (if not already):
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/zed-nix.git
   git push -u origin main
   ```

2. **Deploy documentation**:
   ```bash
   python3 -m mkdocs gh-deploy
   ```

3. **Enable GitHub Pages**:
   - Go to your repo on GitHub
   - Settings → Pages
   - Source: Deploy from branch
   - Branch: `gh-pages`
   - Click Save

4. **Access your docs**:
   ```
   https://YOUR_USERNAME.github.io/zed-nix/
   ```

#### Auto-Deploy with GitHub Actions

Create `.github/workflows/docs.yml`:

```yaml
name: Deploy Documentation

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
      
      - uses: actions/setup-python@v5
        with:
          python-version: 3.x
      
      - run: pip install mkdocs-material
      
      - run: mkdocs gh-deploy --force

```

Now docs auto-deploy on every push to `main`!

---

### Option 2: Netlify (Also FREE!)

Great if you want custom domain and preview deploys.

#### Setup Steps

1. **Build the site**:
   ```bash
   python3 -m mkdocs build
   ```

2. **Go to** [netlify.com](https://netlify.com) and sign in

3. **Deploy**:
   - Drag & drop the `site/` folder
   - Or connect GitHub repo

4. **Configure** (if using Git):
   - Build command: `pip install mkdocs-material && mkdocs build`
   - Publish directory: `site`

5. **Custom domain** (optional):
   - Domain settings → Add custom domain

---

### Option 3: Read the Docs

Free for open source, great for versioning.

#### Setup Steps

1. **Create `requirements.txt`**:
   ```txt
   mkdocs-material==9.6.22
   ```

2. **Sign up** at [readthedocs.org](https://readthedocs.org)

3. **Import project**:
   - Connect GitHub account
   - Select your repo
   - Click "Build"

4. **Access**:
   ```
   https://zed-nix.readthedocs.io
   ```

---

### Option 4: Self-Host

Host on your own server.

```bash
# Build static site
python3 -m mkdocs build

# Output is in site/
# Copy to your web server
scp -r site/* user@server:/var/www/html/zed-nix/
```

Configure nginx/Apache to serve the `site/` directory.

---

## Updating Documentation

### Local Workflow

1. **Edit markdown files** in `docs/`
2. **Preview changes**: `python3 -m mkdocs serve`
3. **Commit**: `git commit -am "Update docs"`
4. **Push**: `git push`
5. **Deploy**: `python3 -m mkdocs gh-deploy` (or auto-deploys)

### Quick Changes

```bash
# Edit a doc
nano docs/quick-start.md

# Preview
python3 -m mkdocs serve

# Deploy
python3 -m mkdocs gh-deploy
```

---

## Customization

### Change Colors

Edit `mkdocs.yml`:

```yaml
theme:
  palette:
    - scheme: default
      primary: blue    # Change to: red, pink, purple, etc.
      accent: blue
```

### Add Pages

1. Create new `.md` file in `docs/`
2. Add to `mkdocs.yml` nav:
   ```yaml
   nav:
     - New Page: new-page.md
   ```

### Change Logo

Add to `mkdocs.yml`:

```yaml
theme:
  logo: assets/logo.png
  favicon: assets/favicon.ico
```

---

## Analytics (Optional)

### Google Analytics

Add to `mkdocs.yml`:

```yaml
extra:
  analytics:
    provider: google
    property: G-XXXXXXXXXX
```

### Plausible Analytics

```yaml
extra:
  analytics:
    provider: plausible
    domain: your-domain.com
```

---

## SEO Optimization

Already configured!

- ✅ Sitemap generated automatically
- ✅ Meta descriptions from page content
- ✅ Open Graph tags
- ✅ Fast loading times
- ✅ Mobile responsive

### Improve SEO

Add to each `.md` file:

```markdown
---
title: Custom Page Title
description: Page description for search engines
---

# Page Content
```

---

## Custom Domain

### GitHub Pages

1. **Buy domain** (e.g., from Namecheap)

2. **Add CNAME file**:
   ```bash
   echo "docs.your-domain.com" > docs/CNAME
   ```

3. **Configure DNS**:
   - Add CNAME record pointing to `YOUR_USERNAME.github.io`

4. **Enable in GitHub**:
   - Settings → Pages → Custom domain

### Netlify

1. Domain settings → Add domain
2. Follow Netlify's DNS instructions

---

## Maintenance

### Update Dependencies

```bash
pip3 install --upgrade mkdocs-material
```

### Check for Broken Links

```bash
pip3 install mkdocs-htmlproofer-plugin

# Add to mkdocs.yml:
plugins:
  - htmlproofer

# Run build (will check links)
python3 -m mkdocs build
```

---

## Troubleshooting

### Build Fails

```bash
# Check for errors
python3 -m mkdocs build --strict

# Common issues:
# - Broken internal links
# - Missing images
# - Invalid YAML in mkdocs.yml
```

### GitHub Pages 404

- Check `gh-pages` branch exists
- Verify Pages is enabled in settings
- Wait 5-10 minutes for propagation

### Styles Not Loading

- Clear browser cache
- Check browser console for errors
- Verify `site_url` in `mkdocs.yml`

---

## Resources

- [MkDocs Documentation](https://www.mkdocs.org/)
- [Material Theme Docs](https://squidfunk.github.io/mkdocs-material/)
- [GitHub Pages Guide](https://docs.github.com/en/pages)
- [Netlify Docs](https://docs.netlify.com/)

---

## Quick Commands Reference

```bash
# Preview locally
python3 -m mkdocs serve

# Build site
python3 -m mkdocs build

# Deploy to GitHub Pages
python3 -m mkdocs gh-deploy

# Deploy with custom message
python3 -m mkdocs gh-deploy -m "Update documentation"

# Strict build (fails on warnings)
python3 -m mkdocs build --strict

# Clean build artifacts
rm -rf site/
```

---

## Next Steps

1. **Preview locally** to see your beautiful docs
2. **Deploy to GitHub Pages** for free hosting
3. **Share the URL** with your users
4. **Keep docs updated** as you develop

**Your docs are ready to go live!** 🚀

---

**Recommended:** Deploy to GitHub Pages now with one command:

```bash
python3 -m mkdocs gh-deploy
```

Then visit: `https://YOUR_USERNAME.github.io/zed-nix/`

