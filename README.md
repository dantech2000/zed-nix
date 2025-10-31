# Nix Language Support for Zed

A Zed editor extension that provides comprehensive Nix language support, including syntax highlighting and Language Server Protocol (LSP) integration.

## Features

- **Syntax Highlighting**: Full syntax highlighting for Nix expressions using Tree-sitter
- **LSP Integration**: IDE features powered by the `nil` language server:
  - Autocompletion
  - Go-to-definition
  - Hover documentation
  - Error diagnostics
  - Code formatting

## Prerequisites

### Installing nil Language Server

The extension requires the `nil` language server to be installed and available in your PATH.

#### Using Nix

```bash
nix-env -iA nixpkgs.nil
```

#### Using Nix Flakes

```bash
nix profile install nixpkgs#nil
```

#### From Source

```bash
cargo install --git https://github.com/oxalica/nil nil
```

## Installation

### From Zed Extensions Registry

1. Open Zed
2. Open the command palette (`Cmd+Shift+P` on macOS)
3. Search for "zed: extensions"
4. Search for "Nix Language Support"
5. Click "Install"

### Development Installation

1. Clone this repository
2. Open Zed
3. Run `zed: install dev extension` from the command palette
4. Select the cloned directory

## Usage

Once installed, the extension will automatically activate when you open `.nix` files.

### Supported File Types

- `.nix` - Nix expression files
- `flake.nix` - Nix flake files
- `default.nix` - Nix build files
- `shell.nix` - Nix shell files

## Development

### Building from Source

1. Install Rust via rustup:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. Add the WebAssembly target:
   ```bash
   rustup target add wasm32-wasip1
   ```

3. Build the extension:
   ```bash
   cargo build --release --target wasm32-wasip1
   ```

### Project Structure

```
.
├── extension.toml          # Extension metadata
├── Cargo.toml             # Rust dependencies
├── LICENSE                # MIT License
├── README.md              # This file
├── src/
│   └── lib.rs            # Extension implementation (LSP integration)
└── languages/
    └── nix/
        ├── config.toml    # Language configuration
        ├── highlights.scm # Syntax highlighting rules
        └── tree-sitter-nix/ # Tree-sitter grammar (submodule)
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## Known Limitations

- The `nil` language server must be installed separately
- Some advanced Nix features may have limited support depending on the language server capabilities

## License

MIT License - see [LICENSE](LICENSE) file for details

## Resources

- [Zed Editor](https://zed.dev/)
- [nil Language Server](https://github.com/oxalica/nil)
- [tree-sitter-nix](https://github.com/cstrahan/tree-sitter-nix)
- [Nix Package Manager](https://nixos.org/)

## Acknowledgments

- Built using the [Zed Extension API](https://github.com/zed-industries/zed)
- Syntax highlighting powered by [tree-sitter-nix](https://github.com/cstrahan/tree-sitter-nix)
- LSP support provided by [nil](https://github.com/oxalica/nil)

