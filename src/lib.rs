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
        const NIL_NOT_FOUND: &str = "nil language server not found in PATH. Please install nil: https://github.com/oxalica/nil";
        let path = worktree
            .which("nil")
            .ok_or_else(|| NIL_NOT_FOUND.to_string())?;

        Ok(zed::Command {
            command: path,
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(NixExtension);

