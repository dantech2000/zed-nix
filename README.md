# Nix Language Extension for Zed

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive Nix language extension for Zed editor with syntax highlighting and LSP integration.

## Features

- **Syntax Highlighting** - Full Tree-sitter powered highlighting
- **LSP Integration** - IDE features via nil language server
- **Fast & Lightweight** - Compiled to WebAssembly
- **Well Documented** - Complete user and developer guides

## Quick Start

### Installation

From Zed Extensions (once published):
```
Cmd+Shift+P → "zed: extensions" → Search "Nix" → Install
```

### Prerequisites

Install nil language server for full LSP features:

```bash
# Using Nix
nix-env -iA nixpkgs.nil

# Using Cargo
cargo install --git https://github.com/oxalica/nil nil
```

## Documentation

📖 **[View Full Documentation](https://dantech2000.github.io/zed-nix/)**

- [Quick Start Guide](https://dantech2000.github.io/zed-nix/quick-start)
- [Installation Instructions](https://dantech2000.github.io/zed-nix/user-guide/installation)
- [Feature Details](https://dantech2000.github.io/zed-nix/user-guide/features)
- [Developer Guide](https://dantech2000.github.io/zed-nix/developer-guide/testing)

## Development

### Prerequisites

Before developing or testing this extension, ensure you have:

1. **Rust installed via rustup** (required)
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
   ⚠️ **Important**: Rust must be installed via `rustup`. Installing Rust through other means may cause issues with dev extensions in Zed.

2. **Zed Editor** installed
   - Download from [zed.dev](https://zed.dev)

3. **Git submodules initialized** (for tree-sitter grammar)
   ```bash
   make submodules
   # or manually:
   git submodule update --init --recursive
   ```

### Quick Start for Development

1. **Build the extension:**
   ```bash
   make build
   ```

2. **Install as dev extension in Zed:**
   - Open Zed editor
   - Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Linux)
   - Type: `zed: install dev extension`
   - Select this directory (`zed-nix`)

3. **Test the extension:**
   - Open `test-example.nix` in Zed
   - Verify syntax highlighting works
   - Check Zed logs if needed: `Cmd+Shift+P` → `zed: open log`

### Development Workflow

The project includes a `Makefile` with convenient commands:

```bash
# Build the extension
make build

# Check code compiles (faster than full build)
make check

# Build and show installation instructions
make install

# Initialize git submodules (tree-sitter grammar)
make submodules

# Run extension tests/checks
make test

# Build documentation
make docs

# Serve documentation locally
make serve

# Clean build artifacts
make clean

# Show all available commands
make help
```

### Testing the Extension

#### Test Syntax Highlighting

1. Open `test-example.nix` in Zed
2. Verify highlighting for:
   - Keywords (`let`, `in`, `if`, `then`, `else`, `inherit`, `with`)
   - Strings (quoted text)
   - Comments (lines starting with `#`)
   - Numbers and operators
   - Built-in functions (`map`, `import`, etc.)

#### Test LSP Features (requires nil)

1. **Install nil language server:**
   ```bash
   # Using Nix
   nix-env -iA nixpkgs.nil
   
   # Or using Cargo
   cargo install --git https://github.com/oxalica/nil nil
   ```

2. **Restart Zed** after installing nil

3. **Test LSP features:**
   - **Autocompletion**: Type `pkgs.` and wait for suggestions
   - **Hover docs**: Hover over variables/functions to see documentation
   - **Go-to-definition**: `Cmd/Ctrl+Click` on variables
   - **Error diagnostics**: Add a syntax error and see red underlines
   - **Format**: Right-click → "Format Document"

#### Check Zed Logs

If something doesn't work:
```bash
# In Zed: Cmd+Shift+P → "zed: open log"
# Or from terminal with verbose logging:
zed --foreground
```

Common log issues:
- `"nil not found in PATH"` → Install nil or extension works without LSP
- Tree-sitter errors → Run `make submodules`
- WASM errors → Run `make clean && make build`

### Documentation Development

Preview documentation locally:
```bash
make serve
# Opens at http://127.0.0.1:8000
```

Build documentation:
```bash
make docs
# Output in ./site/
```

## Project Structure

```
zed-nix/
├── extension.toml          # Extension metadata
├── Cargo.toml           # Rust configuration
├── Makefile               # Development commands (make help)
├── src/
│   └── lib.rs             # Extension implementation
├── languages/nix/         # Language support
│   ├── config.toml        # Language config
│   ├── highlights.scm   # Syntax highlighting
│   └── tree-sitter-nix/   # Grammar (git submodule)
├── docs/                  # Documentation website
├── mkdocs.yml            # Docs configuration
├── test-example.nix      # Test file for development
└── .github/
    └── workflows/
        └── docs.yml      # GitHub Actions for docs deployment
```

## Contributing

Contributions welcome! See [Developer Guide](https://dantech2000.github.io/zed-nix/developer-guide/testing) for details.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Zed Editor](https://zed.dev/)
- [tree-sitter-nix](https://github.com/cstrahan/tree-sitter-nix)
- [nil Language Server](https://github.com/oxalica/nil)

## Links

- **Documentation**: https://dantech2000.github.io/zed-nix/
- **Repository**: https://github.com/dantech2000/zed-nix
- **Issues**: https://github.com/dantech2000/zed-nix/issues
- **Zed Extensions**: https://zed.dev/extensions
