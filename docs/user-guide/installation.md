# Installation Guide

Complete guide to installing the Nix Language Extension for Zed.

## Quick Install

=== "From Zed Registry"
    ```bash
    # In Zed:
    # 1. Press Cmd+Shift+P
    # 2. Type: "zed: extensions"
    # 3. Search: "Nix Language Support"
    # 4. Click: Install
    ```

=== "Dev Extension (Local)"
    ```bash
    # Clone and install
    git clone https://github.com/dantech2000/zed-nix.git
    # In Zed: Cmd+Shift+P → "install dev extension"
    # Select the cloned directory
    ```

---

## Prerequisites

### 1. Zed Editor

Download and install from [zed.dev](https://zed.dev)

```bash
# macOS
brew install zed

# Or download from website
open https://zed.dev
```

### 2. nil Language Server (Optional but Recommended)

The `nil` language server provides LSP features. Choose one installation method:

=== "Nix Package Manager"
    ```bash
    nix-env -iA nixpkgs.nil
    ```

=== "Nix Flakes"
    ```bash
    nix profile install nixpkgs#nil
    ```

=== "From Source (Cargo)"
    ```bash
    cargo install --git https://github.com/oxalica/nil nil
    ```

=== "Home Manager"
    ```nix
    # In your home.nix
    home.packages = with pkgs; [
      nil
    ];
    ```

**Verify Installation:**
```bash
which nil
# Should output: /path/to/nil

nil --version
# Should show version info
```

---

## Installation Methods

### Method 1: From Zed Extensions Registry (Recommended)

!!! success "Easiest Method"
    Once published, this is the simplest way to install.

**Steps:**

1. Open Zed
2. Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Linux)
3. Type: `zed: extensions`
4. Click on Extensions panel
5. Search for: `Nix Language Support`
6. Click `Install`
7. Restart Zed (if prompted)

**Automatic Updates:**

Extensions installed from the registry auto-update when new versions are released.

---

### Method 2: Dev Extension (For Development/Testing)

!!! info "For Developers"
    Use this method for testing or contributing to the extension.

**Steps:**

1. **Clone the repository:**
   ```bash
   git clone https://github.com/dantech2000/zed-nix.git
   cd zed-nix
   ```

2. **Initialize submodules:**
   ```bash
   git submodule update --init --recursive
   ```

3. **Install in Zed:**
   - Open Zed
   - Press `Cmd+Shift+P`
   - Type: `zed: install dev extension`
   - Select the cloned directory

4. **Verify installation:**
   - Open a `.nix` file
   - Check for syntax highlighting

**Updating Dev Extension:**

```bash
cd zed-nix
git pull origin main
git submodule update --recursive
# Restart Zed
```

---

### Method 3: Build from Source

!!! warning "Advanced Users"
    Only needed if you want to modify the extension code.

**Prerequisites:**
- Rust (via rustup)
- Git

**Steps:**

1. **Install Rust:**
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. **Add WASM target:**
   ```bash
   rustup target add wasm32-wasip1
   ```

3. **Clone and build:**
   ```bash
   git clone https://github.com/dantech2000/zed-nix.git
   cd zed-nix
   git submodule update --init --recursive
   cargo build --release --target wasm32-wasip1
   ```

4. **Install in Zed:**
   - Cmd+Shift+P → `zed: install dev extension`
   - Select the directory

---

## Verification

After installation, verify everything works:

### 1. Check Extension is Loaded

```
Cmd+Shift+P → "zed: extensions"
Look for "Nix Language Support" in installed extensions
```

### 2. Test Syntax Highlighting

Create a test file `test.nix`:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    nil
  ];
}
```

You should see:
- Keywords (`pkgs`, `mkShell`) highlighted
- Strings in color
- Comments formatted differently

### 3. Test LSP Features (if nil installed)

In your `test.nix` file:

1. **Type `pkgs.`** - should show completions
2. **Hover over `mkShell`** - should show documentation
3. **Add an error** (e.g., unclosed brace) - should show red underline

---

## Troubleshooting

??? question "Extension not showing in Zed?"
    **Solution:**
    
    1. Check Zed logs: `Cmd+Shift+P` → `zed: open log`
    2. Look for errors related to "nix" or extensions
    3. Try restarting Zed
    4. Reinstall the extension

??? question "No syntax highlighting?"
    **Possible causes:**
    
    1. **File not recognized as Nix**
       - Check file extension is `.nix`
       - Try reopening the file
    
    2. **Tree-sitter grammar not loaded**
       ```bash
       cd zed-nix
       git submodule update --init --recursive
       ```
       - Reinstall extension
    
    3. **Extension not activated**
       - Check extensions panel
       - Restart Zed

??? question "LSP features not working?"
    **Check nil installation:**
    
    ```bash
    which nil
    ```
    
    If nil is not found:
    - Install using one of the methods above
    - Make sure nil is in your PATH
    - Restart Zed after installing
    
    **Check Zed LSP logs:**
    - `Cmd+Shift+P` → `zed: open log`
    - Look for "language server" errors
    - Check for "nil" startup messages

??? question "Extension installed but not working?"
    **Complete reset:**
    
    1. Uninstall extension:
       ```
       Cmd+Shift+P → "zed: extensions"
       Find "Nix Language Support"
       Click "Uninstall"
       ```
    
    2. Restart Zed
    
    3. Reinstall extension
    
    4. If still not working, check:
       - Zed version (needs 0.120.0+)
       - Extension compatibility
       - System requirements

---

## Uninstallation

### Remove Extension

```
Cmd+Shift+P → "zed: extensions"
Find "Nix Language Support"
Click "Uninstall"
Restart Zed
```

### Remove nil (if desired)

=== "Nix"
    ```bash
    nix-env -e nil
    ```

=== "Cargo"
    ```bash
    cargo uninstall nil
    ```

---

## Next Steps

<div class="grid cards" markdown>

-   :material-feature-search:{ .lg .middle } __Explore Features__

    ---

    Learn what the extension can do

    [:octicons-arrow-right-24: Features](features.md)

-   :material-test-tube:{ .lg .middle } __Test It__

    ---

    Try out all the features

    [:octicons-arrow-right-24: Testing Guide](../developer-guide/testing.md)

</div>

