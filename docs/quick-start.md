# Quick Start Guide

Get your Nix extension running in 2 minutes!

## TL;DR - Test Your Extension Now

!!! tip "Fast Track"
    ```bash
    # 1. Open Zed
    zed /Users/drodriguez/src/rainbow-indent

    # 2. In Zed, press Cmd+Shift+P
    # Type: "install dev extension"
    # Select this directory

    # 3. Open test-example.nix
    # See syntax highlighting work! ✨
    ```

---

## What You Have

!!! success "Complete Extension"
    - ✅ Syntax highlighting (works immediately)
    - ✅ LSP support (requires nil to be installed)
    - ✅ Professional documentation
    - ✅ Ready to publish

---

## Step-by-Step Installation

### Step 1: Open in Zed

```bash
zed /Users/drodriguez/src/rainbow-indent
```

### Step 2: Install as Dev Extension

1. Press **`Cmd+Shift+P`** (opens command palette)
2. Type: **`install dev`**
3. Select: **`zed: install dev extension`**
4. Choose this directory
5. Wait for "Extension installed" notification

### Step 3: Open Test File

1. In Zed's file tree, click **`test-example.nix`**
2. See colorful syntax highlighting! 🎨

---

## Want Full LSP Features?

Install the **nil** language server for autocompletion, go-to-definition, and more:

=== "Using Nix"
    ```bash
    nix-env -iA nixpkgs.nil
    ```

=== "Using Nix Flakes"
    ```bash
    nix profile install nixpkgs#nil
    ```

=== "Using Cargo"
    ```bash
    cargo install --git https://github.com/oxalica/nil nil
    ```

=== "Verify"
    ```bash
    which nil
    # Should show: /path/to/nil
    ```

!!! warning "Restart Required"
    After installing nil, restart Zed to activate LSP features.

---

## Testing LSP Features

Once nil is installed, try these:

### Autocompletion
Type `pkgs.` and wait - you should see suggestions

### Hover Documentation
Hover over `builtins` or functions to see docs

### Go-to-Definition
`Cmd+Click` on variables to jump to definitions

### Error Diagnostics
Add a syntax error - see red underlines

---

## Files to Explore

| File | Description |
|------|-------------|
| `test-example.nix` | Test file with various Nix features |
| `src/lib.rs` | Extension implementation |
| `languages/nix/highlights.scm` | Syntax highlighting rules |
| `extension.toml` | Extension metadata |

---

## Next Steps

<div class="grid cards" markdown>

-   :material-book:{ .lg .middle } __Learn More__

    ---

    Read the complete user guide

    [:octicons-arrow-right-24: User Guide](user-guide/overview.md)

-   :material-test-tube:{ .lg .middle } __Test Thoroughly__

    ---

    Follow the detailed testing guide

    [:octicons-arrow-right-24: Testing](developer-guide/testing.md)

-   :material-publish:{ .lg .middle } __Publish__

    ---

    Share with the community

    [:octicons-arrow-right-24: Publishing](developer-guide/publishing.md)

</div>

---

## Troubleshooting

??? question "Extension won't install?"
    - Make sure you selected the correct directory
    - Check Zed logs: `Cmd+Shift+P` → `zed: open log`
    - Try restarting Zed

??? question "No syntax highlighting?"
    - Verify tree-sitter submodule loaded:
      ```bash
      git submodule update --init --recursive
      ```
    - Restart Zed

??? question "LSP not working?"
    - Check nil is installed: `which nil`
    - Check Zed logs for errors
    - Syntax highlighting works without nil!

??? question "Want to rebuild?"
    ```bash
    cargo build --release --target wasm32-wasip1
    # Then reinstall the dev extension
    ```

---

!!! tip "Pro Tip"
    This extension is a great template! Copy this structure to create extensions for other languages. Just swap the tree-sitter grammar and LSP server. 🚀

