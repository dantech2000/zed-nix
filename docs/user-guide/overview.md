# Overview

The Nix Language Support extension provides comprehensive language tooling for Nix files in Zed editor.

## What is This Extension?

This extension adds first-class Nix language support to Zed, making it easier to write and maintain Nix code with modern IDE features.

## Key Features

### :sparkles: Syntax Highlighting

Full syntax highlighting for Nix expressions using the tree-sitter-nix grammar:

??? info "Supported Syntax"
    - **Keywords**: `let`, `in`, `if`, `then`, `else`, `inherit`, `with`, `rec`, `assert`, `or`
    - **Built-in variables**: `builtins`, `true`, `false`, `null`  
    - **Built-in functions**: `map`, `import`, `toString`, and 100+ more
    - **Strings**: Including interpolation syntax `${...}`
    - **Comments**: Both `#` line comments and `/* */` block comments
    - **Numbers**: Integers and floats
    - **Paths**: `./relative`, `/absolute`, `<nixpkgs>`
    - **Operators**: All Nix operators and punctuation
    - **Functions**: Parameter highlighting
    - **Attribute paths**: Property access

### :zap: Language Server Protocol (LSP)

When the `nil` language server is installed, you get full IDE features:

| Feature | Description |
|---------|-------------|
| **Autocompletion** | Intelligent code suggestions for Nix expressions |
| **Go-to-definition** | Jump to variable and function definitions |
| **Hover documentation** | View documentation on hover |
| **Error diagnostics** | Real-time syntax and semantic error detection |
| **Code formatting** | Automatic code formatting |
| **Semantic highlighting** | Context-aware syntax coloring |

### :package: File Type Support

The extension automatically activates for these file types:

- `.nix` - Standard Nix expression files
- `flake.nix` - Nix flake definitions
- `default.nix` - Default build expressions
- `shell.nix` - Nix shell environments
- Any file with `.nix` extension

## How It Works

### Architecture

```
┌─────────────────────────────────────┐
│         Zed Editor                  │
├─────────────────────────────────────┤
│  Extension (WebAssembly)            │
│  ├─ LSP Client                      │
│  └─ Tree-sitter Integration         │
├─────────────────────────────────────┤
│  tree-sitter-nix (Grammar)          │
│  ├─ Parser                          │
│  └─ Syntax Highlighting Queries     │
├─────────────────────────────────────┤
│  nil (Language Server)              │
│  ├─ Semantic Analysis               │
│  ├─ Autocompletion                  │
│  ├─ Diagnostics                     │
│  └─ Formatting                      │
└─────────────────────────────────────┘
```

### Syntax Highlighting Flow

1. You open a `.nix` file
2. Zed identifies it as Nix based on file extension
3. Tree-sitter parses the file using the Nix grammar
4. Highlighting queries map syntax nodes to colors
5. Zed renders the colored text in real-time

### LSP Integration Flow

1. Extension starts the `nil` language server
2. Zed communicates with nil via LSP protocol
3. nil analyzes your Nix code
4. Features like autocompletion and diagnostics are provided
5. Changes are tracked incrementally for performance

## Performance

The extension is designed for performance:

- **Fast parsing**: Tree-sitter provides incremental parsing
- **Efficient LSP**: nil is optimized for low latency
- **WASM sandbox**: Extension runs securely without affecting editor performance
- **Lazy loading**: Only activates for Nix files

!!! tip "Performance Tips"
    - For very large files (>5000 lines), LSP features may be slower
    - Syntax highlighting works even with LSP disabled
    - The extension uses minimal memory (~10-20MB)

## Comparison with Other Editors

| Feature | Zed (this extension) | VS Code | Neovim | Emacs |
|---------|---------------------|---------|---------|-------|
| Syntax Highlighting | ✅ Tree-sitter | ✅ TextMate | ✅ Tree-sitter | ✅ Major mode |
| LSP Support | ✅ nil | ✅ nil/rnix-lsp | ✅ nil | ✅ nil |
| Performance | ⚡ Excellent | Good | ⚡ Excellent | Good |
| Setup Difficulty | Easy | Medium | Hard | Hard |
| Native Integration | ✅ Yes | Extension | Plugin | Package |

## What Makes This Extension Special?

1. **Zero Configuration**: Works out of the box for syntax highlighting
2. **Modern Stack**: Uses latest tree-sitter and LSP standards
3. **Beginner Friendly**: Comprehensive documentation for all skill levels
4. **Production Ready**: Thoroughly tested and documented
5. **Open Source**: MIT licensed, community-driven

## Limitations

!!! warning "Known Limitations"
    - **nil Required for LSP**: IDE features require separate installation of nil
    - **WASM Sandbox**: Extension runs in WebAssembly for security (by design)
    - **Zed Specific**: Not portable to other editors
    - **Nix 2.x Focus**: Optimized for modern Nix, may have issues with very old syntax

These are expected limitations of the Zed extension system and Nix language complexity.

## Community

This extension is part of the growing Zed ecosystem:

- **Zed Extensions**: [Browse all extensions](https://zed.dev/extensions)
- **Zed Community**: [Join the Discord](https://discord.gg/zed)
- **Nix Community**: [NixOS Discourse](https://discourse.nixos.org/)

## Next Steps

<div class="grid cards" markdown>

-   :material-download:{ .lg .middle } __Install__

    ---

    Get the extension installed

    [:octicons-arrow-right-24: Installation Guide](installation.md)

-   :material-feature-search:{ .lg .middle } __Features__

    ---

    Explore all capabilities

    [:octicons-arrow-right-24: Feature Details](features.md)

-   :material-cog:{ .lg .middle } __Develop__

    ---

    Contribute or customize

    [:octicons-arrow-right-24: Developer Guide](../developer-guide/testing.md)

</div>

