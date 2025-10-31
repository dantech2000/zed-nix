# Testing Guide for Nix Language Extension

This guide will help you test the Nix language extension locally before publishing.

## Prerequisites

1. **Zed Editor** must be installed
2. **Rust** must be installed via rustup
3. **nil language server** should be installed (optional for syntax highlighting test, required for LSP features)

## Step 1: Verify the Build

The extension should already be compiled. If not, build it:

```bash
cargo build --release --target wasm32-wasip1
```

Expected output: Successful compilation with no errors.

## Step 2: Install as Dev Extension in Zed

1. Open Zed editor
2. Open the command palette:
   - macOS: `Cmd+Shift+P`
   - Linux: `Ctrl+Shift+P`
3. Type: `zed: install dev extension`
4. Select this directory (`/Users/drodriguez/src/zed-nix`)

You should see a notification that the extension was installed successfully.

## Step 3: Test Syntax Highlighting

1. In Zed, open the test file: `test-example.nix`
2. Verify that syntax highlighting is working:
   - **Keywords** (`let`, `in`, `if`, `then`, `else`, `inherit`, `with`) should be highlighted
   - **Strings** should be highlighted differently
   - **Comments** (lines starting with `#`) should be highlighted as comments
   - **Numbers** should be highlighted
   - **Built-in functions** (`map`, `import`, etc.) should be highlighted
   - **String interpolation** (`${...}`) should be highlighted specially

## Step 4: Test LSP Features (requires nil)

### 4.1 Check if nil is installed

```bash
which nil
```

If nil is not found, install it:

```bash
# Using Nix
nix-env -iA nixpkgs.nil

# Or using cargo
cargo install --git https://github.com/oxalica/nil nil
```

### 4.2 Test LSP Features

Open `test-example.nix` in Zed and test:

1. **Autocompletion**
   - Type `pkgs.` and wait - you should see completion suggestions
   - Type `lib.` and wait - you should see lib functions

2. **Hover Documentation**
   - Hover over `pkgs` - you should see documentation
   - Hover over built-in functions like `map` or `import`

3. **Go-to-Definition**
   - Click on a variable like `name` or `version` while holding Cmd/Ctrl
   - Should jump to the definition

4. **Error Diagnostics**
   - Add a syntax error (e.g., remove a closing brace `}`)
   - Should see red underlines and error messages

5. **Format Document**
   - Right-click in the file
   - Select "Format Document"
   - The code should be formatted according to nil's formatter

## Step 5: Check Zed Logs

If something doesn't work, check the logs:

1. In Zed, run: `zed: open log`
2. Look for errors related to the Nix extension
3. Common issues:
   - "nil not found in PATH" - install nil
   - Tree-sitter errors - check the grammar submodule
   - WASM compilation errors - rebuild with cargo

## Step 6: Test with Real Projects

Try opening real Nix files from your projects:

- NixOS configuration files (`configuration.nix`)
- Nix flakes (`flake.nix`)
- Nix shells (`shell.nix`)
- Package definitions (`default.nix`)

## Debugging Tips

### Extension Not Loading

1. Check if the extension shows in `zed: extensions`
2. Try restarting Zed
3. Check the compilation was successful: `ls target/wasm32-wasip1/release/*.wasm`

### Syntax Highlighting Not Working

1. Verify the tree-sitter grammar submodule is initialized:
   ```bash
   git submodule update --init --recursive
   ```
2. Check that `languages/nix/highlights.scm` exists
3. Check `languages/nix/config.toml` is correctly configured

### LSP Not Working

1. Verify nil is in PATH: `which nil`
2. Check Zed logs for LSP connection errors
3. Try running nil manually to test: `nil`
4. Check that the extension's `lib.rs` has the correct `language_server_command` implementation

## Performance Testing

Test with large files to ensure good performance:

1. Open a large Nix file (>1000 lines)
2. Verify:
   - Syntax highlighting loads quickly
   - Scrolling is smooth
   - LSP features respond promptly
   - No memory leaks (check Activity Monitor/System Monitor)

## Edge Cases to Test

1. **File with syntax errors** - Should show diagnostics without crashing
2. **Empty file** - Should handle gracefully
3. **Very long lines** - Should not freeze
4. **Files with unusual characters** - UTF-8 support
5. **Files without nil installed** - Should degrade gracefully to syntax highlighting only

## Success Criteria

- ✅ Syntax highlighting works for all Nix language features
- ✅ LSP connects successfully when nil is installed
- ✅ Autocompletion provides relevant suggestions
- ✅ Error diagnostics show up correctly
- ✅ Go-to-definition works for variables and functions
- ✅ Extension loads without errors in Zed logs
- ✅ Performance is acceptable on large files

## Next Steps

Once all tests pass:

1. Update the version in `extension.toml` if needed
2. Commit all changes
3. Push to GitHub
4. Follow the publishing guide in the README to submit to Zed's extension registry

