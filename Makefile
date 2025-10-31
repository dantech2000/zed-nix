.PHONY: help build install test clean check submodules docs serve

# Default target
help:
	@echo "Zed Nix Extension - Development Commands"
	@echo ""
	@echo "Available commands:"
	@echo "  make build       - Build the extension for release (WASM)"
	@echo "  make check       - Check code compiles without building"
	@echo "  make install     - Build and prepare for dev extension install"
	@echo "  make submodules  - Initialize and update git submodules"
	@echo "  make clean       - Clean build artifacts"
	@echo "  make docs        - Build documentation site"
	@echo "  make serve       - Serve documentation locally"
	@echo "  make test       - Run extension checks"
	@echo ""
	@echo "Install as dev extension in Zed:"
	@echo "  1. Run: make install"
	@echo "  2. Open Zed"
	@echo "  3. Cmd+Shift+P → 'zed: install dev extension'"
	@echo "  4. Select this directory"

# Build the extension in release mode
build:
	@echo "Building extension for release..."
	@rustup target add wasm32-wasip1 2>/dev/null || true
	@cargo build --release --target wasm32-wasip1
	@echo "✅ Build complete! Extension available at:"
	@echo "   target/wasm32-wasip1/release/zed_nix.wasm"

# Check code compiles without building
check:
	@echo "Checking code compilation..."
	@rustup target add wasm32-wasip1 2>/dev/null || true
	@cargo check --target wasm32-wasip1
	@echo "✅ Code checks passed"

# Prepare for installation (build + instructions)
install: build
	@echo ""
	@echo "✅ Extension built successfully!"
	@echo ""
	@echo "To install as dev extension in Zed:"
	@echo "  1. Open Zed editor"
	@echo "  2. Press Cmd+Shift+P (or Ctrl+Shift+P on Linux)"
	@echo "  3. Type: 'zed: install dev extension'"
	@echo "  4. Select this directory: $(shell pwd)"
	@echo ""
	@echo "After installation, open test-example.nix to test!"

# Initialize and update git submodules
submodules:
	@echo "Initializing git submodules..."
	@git submodule update --init --recursive
	@echo "✅ Submodules initialized"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@cargo clean
	@echo "✅ Clean complete"

# Build documentation
docs:
	@echo "Building documentation..."
	@pip3 install mkdocs-material 2>/dev/null || pip install mkdocs-material
	@mkdocs build --strict
	@echo "✅ Documentation built in ./site/"

# Serve documentation locally
serve:
	@echo "Starting documentation server..."
	@echo "Open http://127.0.0.1:8000 in your browser"
	@pip3 install mkdocs-material 2>/dev/null || pip install mkdocs-material
	@mkdocs serve

# Test the extension (run checks + verify structure)
test: check
	@echo ""
	@echo "Running extension tests..."
	@test -f extension.toml || (echo "❌ extension.toml not found" && exit 1)
	@test -f src/lib.rs || (echo "❌ src/lib.rs not found" && exit 1)
	@test -f languages/nix/config.toml || (echo "❌ languages/nix/config.toml not found" && exit 1)
	@test -f languages/nix/highlights.scm || (echo "❌ languages/nix/highlights.scm not found" && exit 1)
	@test -f test-example.nix || (echo "⚠️  test-example.nix not found (optional)" && exit 0)
	@echo "✅ All extension files present"

