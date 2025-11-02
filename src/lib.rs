use zed_extension_api::{self as zed, Result};

struct NixExtension;

impl zed::Extension for NixExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        // Support both nixd and nil language servers
        // Users can configure preference in their settings.json:
        //   "languages": { "Nix": { "language_servers": ["nixd", "!nil"] } }
        
        let server_name = language_server_id.as_ref();
        
        match server_name {
            "nixd" => {
                if let Some(path) = worktree.which("nixd") {
                    Ok(zed::Command {
                        command: path,
                        args: vec![],
                        env: Default::default(),
                    })
                } else {
                    Err("nixd not found in PATH. Install with:\n  nix-env -iA nixpkgs.nixd\n  or: nix profile install nixpkgs#nixd".to_string())
                }
            }
            "nil" => {
                if let Some(path) = worktree.which("nil") {
                    Ok(zed::Command {
                        command: path,
                        args: vec![],
                        env: Default::default(),
                    })
                } else {
                    Err("nil not found in PATH. Install with:\n  nix-env -iA nixpkgs.nil\n  or: nix profile install nixpkgs#nil".to_string())
                }
            }
            _ => Err(format!("Unknown language server: {}", server_name))
        }
    }
}

zed::register_extension!(NixExtension);

