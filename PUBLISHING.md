# Publishing Guide

This guide explains how to publish the Nix language extension to the Zed extension registry.

## Prerequisites

1. GitHub account
2. Extension tested locally and working
3. Repository with an accepted license (MIT, Apache 2.0, BSD 3-Clause, or GPLv3)

## Step 1: Prepare Your Repository

### 1.1 Push to GitHub

First, create a new repository on GitHub (e.g., `zed-nix-extension`), then:

```bash
cd /Users/drodriguez/src/zed-nix
git remote add origin https://github.com/YOUR_USERNAME/zed-nix-extension.git
git branch -M main
git push -u origin main
```

### 1.2 Update extension.toml

Update the `repository` field in `extension.toml` with your actual GitHub URL:

```toml
repository = "https://github.com/YOUR_USERNAME/zed-nix-extension"
```

### 1.3 Verify Requirements

Ensure your repository has:
- ✅ Valid LICENSE file (MIT in this case)
- ✅ README.md with installation instructions
- ✅ extension.toml with correct metadata
- ✅ Compiled WASM file in target directory

## Step 2: Fork the Zed Extensions Repository

1. Go to https://github.com/zed-industries/extensions
2. Click "Fork" button (top right)
3. Fork to your **personal account** (not an organization - makes PR process easier)

## Step 3: Clone Your Fork

```bash
cd ~/src  # or wherever you keep your projects
git clone https://github.com/YOUR_USERNAME/extensions.git
cd extensions
```

## Step 4: Initialize Submodules

```bash
git submodule init
git submodule update
```

## Step 5: Add Your Extension as a Submodule

```bash
# Add your extension
git submodule add https://github.com/YOUR_USERNAME/zed-nix-extension.git extensions/nix

# Stage the changes
git add extensions/nix
git add .gitmodules
```

## Step 6: Update extensions.toml

Edit the `extensions.toml` file in the root of the extensions repository.

Add your extension entry (in alphabetical order):

```toml
[nix]
submodule = "extensions/nix"
version = "0.1.0"
```

**Important:** The `version` must match the version in your `extension.toml` file.

## Step 7: Sort Extensions

The Zed repository requires extensions to be sorted. Run:

```bash
# If pnpm is not installed:
npm install -g pnpm

# Sort extensions
pnpm sort-extensions
```

This will automatically sort both `extensions.toml` and `.gitmodules`.

## Step 8: Commit Your Changes

```bash
git add extensions.toml
git commit -m "Add Nix language extension

Adds support for the Nix language with:
- Syntax highlighting via tree-sitter-nix
- LSP integration with nil language server
- Support for all .nix file types
"
```

## Step 9: Push and Create Pull Request

```bash
git push origin main
```

Then:

1. Go to https://github.com/YOUR_USERNAME/extensions
2. Click "Contribute" → "Open pull request"
3. Fill in the PR description:

```markdown
# Add Nix Language Extension

## Description
This extension adds comprehensive Nix language support to Zed, including:

- Syntax highlighting using tree-sitter-nix grammar
- LSP integration with the nil language server
- Support for .nix files (flake.nix, default.nix, shell.nix, etc.)

## Testing
- ✅ Syntax highlighting tested with various Nix files
- ✅ LSP features verified (autocompletion, go-to-definition, diagnostics)
- ✅ Extension loads without errors
- ✅ Compiled successfully to WASM

## License
MIT License (included in repository)

## Related Links
- Extension repo: https://github.com/YOUR_USERNAME/zed-nix-extension
- nil LSP server: https://github.com/oxalica/nil
- tree-sitter-nix: https://github.com/cstrahan/tree-sitter-nix
```

4. Click "Create pull request"

## Step 10: Wait for Review

The Zed team will review your PR. They may:

- Request changes
- Test the extension
- Ask questions about implementation

Be responsive to feedback and make requested changes promptly.

## Step 11: Updating Your Extension

When you need to update your extension:

1. Make changes in your extension repository
2. Update the `version` in `extension.toml`
3. Commit and push changes
4. In the `extensions` fork, update the submodule:

```bash
cd extensions/nix
git pull origin main
cd ../..
git add extensions/nix
```

5. Update the `version` in `extensions.toml` to match
6. Run `pnpm sort-extensions`
7. Commit and create a new PR:

```bash
git commit -m "Update Nix extension to v0.2.0"
git push origin main
```

## Common Issues and Solutions

### Submodule Must Use HTTPS

❌ Wrong: `git@github.com:username/repo.git`
✅ Correct: `https://github.com/username/repo.git`

If you added it wrong:
```bash
# Remove and re-add
git rm extensions/nix
git submodule add https://github.com/YOUR_USERNAME/zed-nix-extension.git extensions/nix
```

### Version Mismatch

Ensure the version in `extensions.toml` exactly matches the version in your `extension.toml`.

### CI Failures

Common CI failures:
1. **License not found**: Ensure LICENSE file is at the repository root
2. **Extensions not sorted**: Run `pnpm sort-extensions`
3. **Invalid TOML**: Check syntax in `extension.toml`

### PR to Organization Instead of Personal Account

Zed staff can't push changes to organization repos. If you forked to an org:
1. Create a new fork under your personal account
2. Repeat the process

## After Publishing

Once your PR is merged:

1. Your extension will be packaged automatically
2. It will appear in the Zed extension registry within a few hours
3. Users can install it via `zed: extensions`

### Promote Your Extension

- Tweet about it
- Post in Zed Discord
- Add to your GitHub profile
- Write a blog post about the development process

## Maintenance

As maintainer, you should:

- Monitor issues in your extension repo
- Keep the extension updated with Zed API changes
- Respond to user feedback
- Update when nil or tree-sitter-nix get new features

## Resources

- [Zed Extension Documentation](https://zed.dev/docs/extensions/developing-extensions)
- [Zed Extensions Repository](https://github.com/zed-industries/extensions)
- [Zed Discord](https://discord.gg/zed)

---

Good luck with your extension! 🚀

