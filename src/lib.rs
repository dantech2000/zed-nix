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
        let path = worktree
            .which("nil")
            .ok_or_else(|| "nil language server not found in PATH. Please install nil: https://github.com/oxalica/nil".to_string())?;

        Ok(zed::Command {
            command: path,
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(NixExtension);

