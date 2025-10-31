# Documentation

This directory contains the source files for the Nix Extension documentation website.

## Structure

```
docs/
├── index.md                    # Homepage
├── quick-start.md             # Quick start guide
├── status.md                  # Project status
├── user-guide/
│   ├── overview.md           # Feature overview
│   ├── installation.md       # Installation instructions
│   └── features.md           # Detailed features
└── developer-guide/
    ├── testing.md            # Testing guide
    ├── publishing.md         # Publishing instructions
    └── project-summary.md    # Technical details
```

## Building Locally

```bash
# Install dependencies
pip3 install mkdocs-material

# Serve locally (with live reload)
python3 -m mkdocs serve

# Build static site
python3 -m mkdocs build

# Deploy to GitHub Pages
python3 -m mkdocs gh-deploy
```

## Configuration

The site is configured in `mkdocs.yml` at the project root.

## Theme

We use [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) for beautiful, modern documentation.

