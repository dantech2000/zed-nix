# Features

Comprehensive guide to all features provided by the Nix Language Extension.

## Syntax Highlighting

Beautiful, semantic syntax highlighting powered by Tree-sitter.

### Supported Elements

=== "Keywords"
    ```nix
    let
      inherit
      with
      rec
      if then else
      assert
      or
    in
    ```

=== "Built-in Variables"
    ```nix
    builtins
    true
    false
    null
    __currentSystem
    __nixVersion
    ```

=== "Built-in Functions"
    ```nix
    map
    import
    toString
    fetchGit
    derivation
    # ... and 100+ more
    ```

=== "Strings"
    ```nix
    "simple string"
    ''
      multi-line
      indented string
    ''
    "${interpolation}"
    ```

=== "Comments"
    ```nix
    # Single line comment
    
    /* 
     * Multi-line
     * block comment
     */
    ```

### Color Scheme

The extension uses your Zed theme's color scheme and maps Nix syntax to appropriate semantic categories:

| Element | Theme Category | Example |
|---------|---------------|---------|
| Keywords | keyword | `let`, `in`, `if` |
| Built-ins | function.builtin | `map`, `import` |
| Strings | string | `"text"` |
| Interpolation | embedded | `${expr}` |
| Comments | comment | `# ...` |
| Numbers | number | `42`, `3.14` |
| Operators | operator | `+`, `==`, `++` |
| Variables | variable | `pkgs` |
| Functions | function | User-defined |
| Properties | property | Attribute names |

---

## LSP Features

Full IDE capabilities when `nil` is installed.

### 1. Autocompletion

Intelligent code suggestions as you type.

**What gets completed:**

- Package names (`pkgs.*`)
- Built-in functions
- Variables in scope
- Attribute paths
- Function parameters

**Example:**

```nix
{ pkgs }: {
  buildInputs = with pkgs; [
    git  # Completion suggests: git, gitFull, git-crypt, etc.
  ];
}
```

!!! tip "Trigger Manually"
    Press `Ctrl+Space` to manually trigger completion

### 2. Go-to-Definition

Jump to where variables and functions are defined.

**Usage:**

- `Cmd+Click` (macOS) or `Ctrl+Click` (Linux) on any identifier
- Or: Right-click → "Go to Definition"
- Or: `F12` key

**Example:**

```nix
let
  myFunc = x: x + 1;  # Definition here
  result = myFunc 5;  # Cmd+Click on myFunc jumps up
in result
```

### 3. Hover Documentation

View documentation and type information on hover.

**Shows:**

- Function signatures
- Built-in function documentation
- Type information
- Value previews

**Example:**

Hover over `pkgs.mkShell` to see:
```
pkgs.mkShell :: AttrSet -> Derivation

Creates a shell environment for development
with the specified buildInputs and other attributes.
```

### 4. Error Diagnostics

Real-time error detection and reporting.

**Detects:**

- **Syntax errors**: Missing braces, semicolons
- **Semantic errors**: Undefined variables
- **Type errors**: Invalid operations
- **Warnings**: Unused variables, deprecated functions

**Example:**

```nix
{ pkgs }:

let
  x = pkgs.git
  y = undefined;  # ❌ Error: undefined variable
```

!!! info "Error Display"
    Errors show as red underlines with messages in the problems panel

### 5. Code Formatting

Automatic code formatting using nil's formatter.

**Usage:**

- Right-click → "Format Document"
- Or: `Shift+Alt+F` (or `Shift+Option+F` on macOS)
- Or: Save with format-on-save enabled

**Before:**

```nix
{pkgs}:{buildInputs=[pkgs.git pkgs.vim];}
```

**After:**

```nix
{ pkgs }: {
  buildInputs = [
    pkgs.git
    pkgs.vim
  ];
}
```

### 6. Document Symbols

Navigate large files using the outline view.

**Shows:**

- Top-level bindings
- Function definitions
- Attribute sets
- Let bindings

**Usage:**

- `Cmd+Shift+O` → Symbol search
- Or: Open outline panel

---

## File Type Support

The extension automatically activates for these files:

| Pattern | Description | Example |
|---------|-------------|---------|
| `*.nix` | All Nix files | `config.nix` |
| `flake.nix` | Nix flakes | `flake.nix` |
| `default.nix` | Default expressions | `default.nix` |
| `shell.nix` | Development shells | `shell.nix` |

---

## Performance Features

### Incremental Parsing

Tree-sitter provides fast, incremental parsing:

- Only re-parses changed sections
- Maintains syntax tree for quick updates
- Minimal CPU usage

### Lazy Activation

Extension only loads when needed:

- Activates on first `.nix` file open
- Zero overhead for non-Nix files
- Unloads when not in use

### Memory Efficient

- ~10-20MB memory usage
- Scales well with file size
- No memory leaks

---

## Keyboard Shortcuts

Default shortcuts for common actions:

| Action | macOS | Linux/Windows |
|--------|-------|---------------|
| Completion | `Ctrl+Space` | `Ctrl+Space` |
| Go-to-definition | `F12` | `F12` |
| Format document | `Shift+Option+F` | `Shift+Alt+F` |
| Symbol search | `Cmd+Shift+O` | `Ctrl+Shift+O` |
| Command palette | `Cmd+Shift+P` | `Ctrl+Shift+P` |

!!! tip "Customization"
    Shortcuts can be customized in Zed settings

---

## Integration Features

### Works With Zed Features

The extension integrates seamlessly with Zed's built-in features:

- **Multi-cursor editing**: Full support
- **Find/Replace**: Works with Nix syntax
- **Git integration**: Blame, diff, etc.
- **Project search**: Searches Nix files
- **Vim mode**: If enabled

### Collaborative Editing

- Works with Zed's collaboration features
- Syntax highlighting syncs across users
- LSP features work in shared sessions

---

## Limitations

!!! warning "Current Limitations"
    
    **LSP Dependent:**
    - IDE features require nil installed
    - Syntax highlighting works without nil
    
    **File Size:**
    - Very large files (>10,000 lines) may be slower
    - LSP features may timeout on huge files
    
    **Nix Version:**
    - Optimized for Nix 2.x syntax
    - Some legacy Nix 1.x syntax may not highlight correctly
    
    **Platform:**
    - macOS and Linux fully supported
    - Windows support depends on nil availability

---

## Feature Comparison

| Feature | Without nil | With nil |
|---------|-------------|----------|
| Syntax Highlighting | ✅ Full | ✅ Full |
| Autocompletion | ❌ | ✅ Full |
| Go-to-definition | ❌ | ✅ Yes |
| Hover Docs | ❌ | ✅ Yes |
| Diagnostics | ❌ | ✅ Yes |
| Formatting | ❌ | ✅ Yes |
| Performance | ⚡ Fast | ⚡ Fast |

---

## Coming Soon

Features planned for future releases:

- [ ] Inline refactoring
- [ ] Code actions (quick fixes)
- [ ] Rename symbol support
- [ ] Find all references
- [ ] Workspace symbols
- [ ] Nix evaluation integration

---

## Next Steps

<div class="grid cards" markdown>

-   :material-test-tube:{ .lg .middle } __Test Features__

    ---

    Try out all the capabilities

    [:octicons-arrow-right-24: Testing Guide](../developer-guide/testing.md)

-   :material-cog:{ .lg .middle } __Contribute__

    ---

    Help add more features

    [:octicons-arrow-right-24: Developer Guide](../developer-guide/project-summary.md)

</div>

