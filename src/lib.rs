use zed_extension_api::{self as zed, Result};

struct NixExtension;

impl zed::Extension for NixExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        // Try nixd first (better for NixOS/home-manager options), fallback to nil
        if let Some(path) = worktree.which("nixd") {
            return Ok(zed::Command {
                command: path,
                args: vec![],
                env: Default::default(),
            });
        }
        
        if let Some(path) = worktree.which("nil") {
            return Ok(zed::Command {
                command: path,
                args: vec![],
                env: Default::default(),
            });
        }

        Err("No Nix language server found. Install nixd (recommended for NixOS/home-manager) or nil:\n  nix-env -iA nixpkgs.nixd\n  or: nix-env -iA nixpkgs.nil".to_string())
    }
}

zed::register_extension!(NixExtension);

