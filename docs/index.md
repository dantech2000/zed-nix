# Nix Language Extension for Zed

Welcome to the complete documentation for the Nix Language Extension for Zed editor!

<div class="grid cards" markdown>

-   :rocket:{ .lg .middle } __Quick Start__

    ---

    Get up and running in 2 minutes

    [:octicons-arrow-right-24: Quick Start](quick-start.md)

-   :material-book-open-variant:{ .lg .middle } __User Guide__

    ---

    Learn how to use all features

    [:octicons-arrow-right-24: User Guide](user-guide/overview.md)

-   :material-cog:{ .lg .middle } __Developer Guide__

    ---

    Contributing and development

    [:octicons-arrow-right-24: Developer Guide](developer-guide/testing.md)

-   :material-chart-line:{ .lg .middle } __Status__

    ---

    Current project status

    [:octicons-arrow-right-24: Status](status.md)

</div>

## Features

### :sparkles: Syntax Highlighting

Full syntax highlighting for Nix expressions using Tree-sitter grammar:

- Keywords (`let`, `in`, `if`, `then`, `else`, `inherit`, `with`, `rec`, `assert`, `or`)
- Built-in variables (`builtins`, `true`, `false`, `null`)
- Built-in functions (`map`, `import`, `toString`, etc.)
- Strings and string interpolation (`${...}`)
- Comments (`#` and `/* */`)
- Numbers, paths, and operators

### :zap: LSP Integration

IDE features powered by the `nil` language server:

- **Autocompletion** - Intelligent code suggestions
- **Go-to-definition** - Jump to variable definitions
- **Hover documentation** - View docs on hover
- **Error diagnostics** - Real-time error detection
- **Code formatting** - Automatic code formatting

### :package: Supported File Types

- `.nix` - Nix expression files
- `flake.nix` - Nix flake files
- `default.nix` - Nix build files
- `shell.nix` - Nix shell files

## Quick Links

<div class="grid cards" markdown>

-   :material-download:{ .lg .middle } __Installation__

    ---

    ```bash
    # Install from Zed Extensions
    Cmd+Shift+P → "zed: extensions"
    Search: "Nix Language Support"
    ```

    [:octicons-arrow-right-24: Full Installation Guide](user-guide/installation.md)

-   :material-test-tube:{ .lg .middle } __Testing__

    ---

    ```bash
    # Test as dev extension
    Cmd+Shift+P → "install dev extension"
    Select this directory
    ```

    [:octicons-arrow-right-24: Testing Guide](developer-guide/testing.md)

</div>

## Prerequisites

!!! info "nil Language Server"
    For full LSP features, install the `nil` language server:
    
    === "Using Nix"
        ```bash
        nix-env -iA nixpkgs.nil
        ```
    
    === "Using Cargo"
        ```bash
        cargo install --git https://github.com/oxalica/nil nil
        ```
    
    === "Verify Installation"
        ```bash
        which nil
        ```

## Project Status

!!! success "Production Ready"
    - ✅ Syntax highlighting complete
    - ✅ LSP integration functional
    - ✅ Compiled and tested
    - ✅ Documentation complete
    - ✅ Ready for publishing

[View Full Status →](status.md){ .md-button .md-button--primary }

## Getting Help

- [:fontawesome-brands-github: GitHub Issues](https://github.com/drodriguez/zed-nix/issues)
- [:material-forum: Zed Discord](https://discord.gg/zed)
- [:material-book: Zed Documentation](https://zed.dev/docs/extensions)
- [:material-language-nix: nil LSP Server](https://github.com/oxalica/nil)

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/drodriguez/zed-nix/blob/main/LICENSE) file for details.

---

**Built with** ❤️ **using** [Zed Extension API](https://github.com/zed-industries/zed), [tree-sitter-nix](https://github.com/cstrahan/tree-sitter-nix), and [nil](https://github.com/oxalica/nil)

