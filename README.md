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

📖 **[View Full Documentation](https://YOUR_USERNAME.github.io/zed-nix/)**

- [Quick Start Guide](https://YOUR_USERNAME.github.io/zed-nix/quick-start)
- [Installation Instructions](https://YOUR_USERNAME.github.io/zed-nix/user-guide/installation)
- [Feature Details](https://YOUR_USERNAME.github.io/zed-nix/user-guide/features)
- [Developer Guide](https://YOUR_USERNAME.github.io/zed-nix/developer-guide/testing)

## Development

### Building from Source

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add WASM target
rustup target add wasm32-wasip1

# Build
cargo build --release --target wasm32-wasip1

# Install as dev extension in Zed
# Cmd+Shift+P → "install dev extension" → select this directory
```

### Documentation

Preview documentation locally:
```bash
pip3 install mkdocs-material
python3 -m mkdocs serve
# Open http://127.0.0.1:8000
```

## Project Structure

```
zed-nix/
├── extension.toml          # Extension metadata
├── Cargo.toml             # Rust configuration
├── src/lib.rs             # Extension implementation
├── languages/nix/         # Language support
│   ├── config.toml        # Language config
│   ├── highlights.scm     # Syntax highlighting
│   └── tree-sitter-nix/   # Grammar (submodule)
├── docs/                  # Documentation website
├── mkdocs.yml            # Docs configuration
└── test-example.nix      # Test file
```

## Contributing

Contributions welcome! See [Developer Guide](https://YOUR_USERNAME.github.io/zed-nix/developer-guide/testing) for details.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Zed Editor](https://zed.dev/)
- [tree-sitter-nix](https://github.com/cstrahan/tree-sitter-nix)
- [nil Language Server](https://github.com/oxalica/nil)

## Links

- **Documentation**: https://YOUR_USERNAME.github.io/zed-nix/
- **Repository**: https://github.com/YOUR_USERNAME/zed-nix
- **Issues**: https://github.com/YOUR_USERNAME/zed-nix/issues
- **Zed Extensions**: https://zed.dev/extensions
