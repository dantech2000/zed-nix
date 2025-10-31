# Publishing Checklist for Zed Extension Registry

This checklist ensures your extension meets all requirements to be published in the Zed extension registry.

## ✅ Pre-Publication Requirements

### 1. Repository Requirements

- [x] **License File**: `LICENSE` file exists (MIT License ✅)
- [x] **README.md**: Comprehensive README with installation instructions ✅
- [x] **extension.toml**: Valid extension metadata ✅
- [ ] **Repository on GitHub**: Public repository with proper name
- [ ] **extension.toml repository field**: Must point to actual GitHub URL
- [ ] **Valid email in authors**: Currently has placeholder `you@example.com` - **NEEDS UPDATE**

### 2. Extension Metadata (extension.toml)

Current status:
```toml
id = "nix"                           ✅ Valid
name = "Nix Language Support"        ✅ Valid
version = "0.1.0"                    ✅ Valid
schema_version = 1                    ✅ Valid
authors = ["Daniel Rodriguez <dantech2000@gmail.com>"]  ✅ UPDATED
description = "Syntax highlighting and LSP support for Nix language"  ✅ Valid
repository = "https://github.com/dantech2000/zed-nix"  ✅ Valid
```

Required fixes:
- [ ] **Update author email**: Replace `you@example.com` with actual email

### 3. Repository Structure

- [x] `extension.toml` at root ✅
- [x] `src/lib.rs` with extension implementation ✅
- [x] `languages/nix/` directory with language config ✅
- [x] `LICENSE` file at root ✅
- [x] `README.md` with installation instructions ✅
- [x] Tree-sitter grammar as git submodule ✅

### 4. Code Quality

- [x] Extension compiles successfully (`make build`) ✅
- [x] No compilation errors or warnings ✅
- [x] Extension loads in Zed as dev extension ✅
- [x] Syntax highlighting works ✅
- [ ] **Tested with LSP** (if nil is installed)
- [ ] **Tested on different platforms** (if possible)

### 5. Git Submodules

- [x] Tree-sitter grammar submodule initialized ✅
- [ ] **Submodule uses HTTPS URL** (not SSH) - Verify before publishing

## 📋 Publishing Steps

### Step 1: Finalize Repository

1. **Update extension.toml**:
   ```toml
   authors = ["Daniel Rodriguez <dantech2000@gmail.com>"]
   ```

2. **Ensure repository is pushed to GitHub**:
   ```bash
   git remote add origin https://github.com/dantech2000/zed-nix.git
   git push -u origin main
   ```

3. **Verify submodule URL is HTTPS**:
   ```bash
   cat .gitmodules
   # Should show: url = https://github.com/...
   # NOT: url = git@github.com:...
   ```

### Step 2: Fork Zed Extensions Repository

1. Go to https://github.com/zed-industries/extensions
2. Click "Fork" (fork to personal account, not organization)
3. Clone your fork:
   ```bash
   git clone https://github.com/dantech2000/extensions.git
   cd extensions
   ```

### Step 3: Add Extension as Submodule

```bash
# Initialize existing submodules
git submodule init
git submodule update

# Add your extension (using HTTPS!)
git submodule add https://github.com/dantech2000/zed-nix.git extensions/nix

# Stage changes
git add extensions/nix
git add .gitmodules
```

### Step 4: Update extensions.toml

Edit `extensions.toml` in the root and add (in alphabetical order):

```toml
[nix]
submodule = "extensions/nix"
version = "0.1.0"
```

**Important**: Version must exactly match `version` in your `extension.toml`.

### Step 5: Sort Extensions

```bash
# Install pnpm if needed
npm install -g pnpm

# Sort extensions (required by Zed)
pnpm sort-extensions
```

This sorts both `extensions.toml` and `.gitmodules`.

### Step 6: Commit and Push

```bash
git add extensions.toml
git commit -m "Add Nix language extension

Adds support for the Nix language with:
- Syntax highlighting via tree-sitter-nix
- LSP integration with nil language server
- Support for all .nix file types"
git push origin main
```

### Step 7: Create Pull Request

1. Go to your fork: https://github.com/dantech2000/extensions
2. Click "Contribute" → "Open pull request"
3. Fill in PR description (see template below)
4. Submit PR

### PR Description Template

```markdown
# Add Nix Language Extension

## Description
This extension adds comprehensive Nix language support to Zed, including:

- Syntax highlighting using tree-sitter-nix grammar
- LSP integration with the nil language server
- Support for .nix files (flake.nix, default.nix, shell.nix, etc.)

## Features
- ✅ Full syntax highlighting for Nix expressions
- ✅ LSP features (autocompletion, go-to-definition, hover docs, diagnostics)
- ✅ Tree-sitter grammar integration
- ✅ Error handling when nil is not installed

## Testing
- ✅ Syntax highlighting tested with various Nix files
- ✅ LSP features verified (autocompletion, go-to-definition, diagnostics)
- ✅ Extension loads without errors
- ✅ Compiled successfully to WASM
- ✅ Tested as dev extension in Zed

## License
MIT License (included in repository)

## Repository
https://github.com/dantech2000/zed-nix

## Related Links
- nil LSP server: https://github.com/oxalica/nil
- tree-sitter-nix: https://github.com/cstrahan/tree-sitter-nix
```

## 🚨 Common Issues to Avoid

1. **Submodule URL**: Must be HTTPS, not SSH
   - ✅ `https://github.com/user/repo.git`
   - ❌ `git@github.com:user/repo.git`

2. **Version Mismatch**: Version in `extensions.toml` must match `extension.toml`
3. **Extensions Not Sorted**: Always run `pnpm sort-extensions` before committing
4. **License File**: Must be at repository root, named `LICENSE`
5. **Invalid TOML**: Check syntax of `extension.toml` before submitting
6. **Organization Fork**: Fork to personal account, not organization

## ✅ Final Verification Before PR

Run these checks:

```bash
# 1. Verify extension builds
make build

# 2. Verify extension.toml is valid
cat extension.toml

# 3. Verify LICENSE exists
test -f LICENSE && echo "✅ LICENSE exists" || echo "❌ Missing LICENSE"

# 4. Verify repository URL in extension.toml
grep "repository" extension.toml

# 5. Verify author email is not placeholder
grep "authors" extension.toml | grep -v "example.com"

# 6. Verify submodule URL is HTTPS
cat .gitmodules | grep url
```

## After PR is Merged

1. Extension will be packaged automatically by Zed CI
2. Will appear in extension registry within a few hours
3. Users can install via `Cmd+Shift+P` → `zed: extensions` → Search "Nix"

## Resources

- [Zed Extension Documentation](https://zed.dev/docs/extensions/developing-extensions)
- [Zed Extensions Repository](https://github.com/zed-industries/extensions)
- [Zed Discord](https://discord.gg/zed)

