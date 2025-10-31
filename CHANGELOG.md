# Changelog

All notable changes to the Nix Language Extension for Zed will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial extension implementation
- Syntax highlighting via tree-sitter-nix grammar
- LSP integration with nil language server
- Support for .nix file types
- Comprehensive documentation website using MkDocs Material
- User guide with installation and feature documentation
- Developer guide with testing and publishing instructions
- Example test file with various Nix features

### Features
- Full syntax highlighting for Nix language elements:
  - Keywords (let, in, if, then, else, inherit, with, rec, assert, or)
  - Built-in variables and functions
  - Strings and interpolation
  - Comments (line and block)
  - Numbers, paths, operators
- LSP features (when nil is installed):
  - Autocompletion
  - Go-to-definition
  - Hover documentation
  - Error diagnostics
  - Code formatting

### Technical
- Rust implementation compiled to WebAssembly
- Tree-sitter grammar integration as git submodule
- MIT License
- Comprehensive documentation with search and navigation

## [0.1.0] - YYYY-MM-DD (Not yet released)

### Initial Release
- First public release of Nix Language Extension for Zed
- Complete syntax highlighting support
- LSP integration with nil
- Professional documentation website

---

## Release Process

When releasing a new version:

1. Update version in `extension.toml`
2. Update this CHANGELOG with release date
3. Create git tag: `git tag -a v0.1.0 -m "Release v0.1.0"`
4. Push tag: `git push origin v0.1.0`
5. Update Zed extensions repository with new version
6. Announce on relevant channels (Zed Discord, etc.)

---

## Version History Legend

- **Added** - New features
- **Changed** - Changes in existing functionality
- **Deprecated** - Soon-to-be removed features
- **Removed** - Removed features
- **Fixed** - Bug fixes
- **Security** - Vulnerability fixes

