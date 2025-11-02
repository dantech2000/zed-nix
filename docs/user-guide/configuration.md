# Configuration Guide

This guide explains how to configure the Nix Language Extension for Zed.

## Language Server Selection

The extension supports two Nix language servers:

- **`nixd`** - Recommended for NixOS and home-manager users (better completions for system options)
- **`nil`** - General-purpose Nix language server (lightweight, widely used)

### Default Behavior

By default, **both language servers will be used** if they're installed in your PATH. Zed will run both simultaneously and merge their results.

### Choose a Specific Language Server

To use only one language server, add this to your Zed `settings.json`:

**Open Settings:**
- Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Linux)
- Type: `zed: open settings`
- Select "Open Settings"

#### Use Only nixd

```json
{
  "languages": {
    "Nix": {
      "language_servers": ["nixd", "!nil"]
    }
  }
}
```

#### Use Only nil

```json
{
  "languages": {
    "Nix": {
      "language_servers": ["nil", "!nixd"]
    }
  }
}
```

**Note:** The `!` prefix disables a language server.

---

## Language Server Settings

### Configure nixd

```json
{
  "lsp": {
    "nixd": {
      "settings": {
        "nixd": {
          "nixpkgs": {
            "expr": "import <nixpkgs> { }"
          },
          "formatting": {
            "command": ["nixpkgs-fmt"]
          },
          "options": {
            "nixos": {
              "expr": "(builtins.getFlake \"/PATH/TO/FLAKE\").nixosConfigurations.CONFIGNAME.options"
            },
            "home-manager": {
              "expr": "(builtins.getFlake \"/PATH/TO/FLAKE\").homeConfigurations.CONFIGNAME.options"
            }
          },
          "diagnostic": {
            "suppress": [
              "sema-extra-with"
            ]
          }
        }
      }
    }
  }
}
```

**Replace:**
- `/PATH/TO/FLAKE` with your flake directory path
- `CONFIGNAME` with your configuration name

### Configure nil

```json
{
  "lsp": {
    "nil": {
      "settings": {
        "nil": {
          "formatting": {
            "command": ["nixpkgs-fmt"]
          },
          "diagnostics": {
            "ignored": ["unused_binding", "unused_with"]
          }
        }
      }
    }
  }
}
```

---

## Installation Paths

### Install nixd

```bash
# Using Nix
nix-env -iA nixpkgs.nixd

# Using Nix Flakes
nix profile install nixpkgs#nixd

# With Home Manager
home.packages = [ pkgs.nixd ];
```

### Install nil

```bash
# Using Nix
nix-env -iA nixpkgs.nil

# Using Nix Flakes
nix profile install nixpkgs#nil

# With Home Manager
home.packages = [ pkgs.nil ];

# From Source (Cargo)
cargo install --git https://github.com/oxalica/nil nil
```

---

## Verify Installation

After installing a language server, verify it's in your PATH:

```bash
# Check nixd
which nixd
nixd --version

# Check nil
which nil
nil --version
```

**Restart Zed** after installing a language server.

---

## Comparison: nixd vs nil

| Feature | nixd | nil |
|---------|------|-----|
| **NixOS Options Completion** | ✅ Excellent | ⚠️ Limited |
| **home-manager Completion** | ✅ Excellent | ⚠️ Limited |
| **Flake Support** | ✅ Full | ✅ Good |
| **Performance** | ✅ Fast | ✅ Very Fast |
| **Diagnostics** | ✅ Good | ✅ Good |
| **Formatting** | ✅ Yes | ✅ Yes |
| **Go-to-Definition** | ✅ Yes | ✅ Yes |
| **Hover Documentation** | ✅ Yes | ✅ Yes |
| **Best For** | NixOS/home-manager | General Nix development |

### Recommendation

- **Use `nixd`** if you work with NixOS configurations or home-manager
- **Use `nil`** for general Nix development, flakes, or package development
- **Use both** (default) to get the best of both servers

---

## Troubleshooting

### Language Server Not Starting

1. **Check if installed:**
   ```bash
   which nixd  # or: which nil
   ```

2. **Check Zed logs:**
   - Press `Cmd+Shift+P` → Type: `zed: open log`
   - Look for errors related to "nix" or "language server"

3. **Restart Zed** after installing the language server

### No Completions Showing

1. **Verify language server is running:**
   - Open a `.nix` file
   - Check status bar (bottom right) for LSP indicator

2. **Check settings.json syntax:**
   - Make sure JSON is valid
   - No trailing commas

3. **Try disabling one server:**
   - Use only `nixd` or only `nil` to isolate issues

### Performance Issues

If both language servers cause slowness:

1. **Disable one server** in settings.json
2. **Use `nil` only** for lighter weight LSP
3. **Check system resources** (CPU/memory usage)

---

## Example Complete Configuration

Here's a complete example `settings.json` for Nix development:

```json
{
  "languages": {
    "Nix": {
      "language_servers": ["nixd"],
      "formatter": {
        "external": {
          "command": "nixpkgs-fmt",
          "arguments": []
        }
      },
      "format_on_save": "on",
      "tab_size": 2
    }
  },
  "lsp": {
    "nixd": {
      "settings": {
        "nixd": {
          "formatting": {
            "command": ["nixpkgs-fmt"]
          },
          "options": {
            "nixos": {
              "expr": "(builtins.getFlake \"/home/user/nixos-config\").nixosConfigurations.desktop.options"
            }
          }
        }
      }
    }
  }
}
```

This configuration:
- Uses only `nixd` as the language server
- Enables format-on-save with `nixpkgs-fmt`
- Configures NixOS options completion
- Sets tab size to 2 spaces

