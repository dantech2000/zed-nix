# Quick Start Guide

## TL;DR - Test Your Extension Now

```bash
# 1. Open Zed
zed .

# 2. Install extension (in Zed):
#    Cmd+Shift+P → "zed: install dev extension" → select this directory

# 3. Open test file:
#    Open test-example.nix

# 4. See syntax highlighting work! ✨
```

## What You Have

✅ **Complete Nix language extension**
- Syntax highlighting (works immediately)
- LSP support (requires nil to be installed)
- Professional documentation
- Ready to publish

## Test It (2 minutes)

### Step 1: Open in Zed
```bash
zed /Users/drodriguez/src/rainbow-indent
```

### Step 2: Install as Dev Extension
1. Press `Cmd+Shift+P` (opens command palette)
2. Type: `install dev`
3. Select: `zed: install dev extension`
4. Choose this directory
5. Wait for "Extension installed" notification

### Step 3: Open Test File
1. In Zed's file tree, click `test-example.nix`
2. See colorful syntax highlighting! 🎨

## Want Full LSP Features?

Install nil language server:

```bash
# If you have Nix installed:
nix-env -iA nixpkgs.nil

# Verify:
which nil

# Restart Zed and get:
# - Autocompletion
# - Go-to-definition
# - Hover docs
# - Error checking
```

## Files You Should Know About

- **`README.md`** - Main documentation
- **`TESTING.md`** - Detailed testing instructions
- **`PUBLISHING.md`** - How to publish to Zed registry
- **`PROJECT_SUMMARY.md`** - Complete project explanation
- **`test-example.nix`** - Test file with various Nix features

## Next Steps

### Just Playing Around?
- Modify `test-example.nix` and see highlighting update
- Try opening your own .nix files
- Read `PROJECT_SUMMARY.md` to understand how it works

### Want to Customize?
- Change colors: edit `languages/nix/highlights.scm`
- Change extension name: edit `extension.toml`
- Modify LSP behavior: edit `src/lib.rs`
- After changes: rebuild with `cargo build --release --target wasm32-wasip1`

### Ready to Publish?
1. Read `PUBLISHING.md`
2. Create GitHub repo for this project
3. Fork zed-industries/extensions
4. Follow the publishing steps
5. Share with the community!

## Troubleshooting

**Extension won't install?**
- Make sure you selected the correct directory
- Check Zed logs: `Cmd+Shift+P` → `zed: open log`

**No syntax highlighting?**
- Verify tree-sitter submodule: `git submodule update --init --recursive`
- Try restarting Zed

**LSP not working?**
- Check nil is installed: `which nil`
- Check Zed logs for errors
- Syntax highlighting will still work!

## Help & Resources

- **Questions?** Read `PROJECT_SUMMARY.md`
- **Testing?** Read `TESTING.md`
- **Publishing?** Read `PUBLISHING.md`
- **Zed Docs:** https://zed.dev/docs/extensions
- **Zed Discord:** https://discord.gg/zed

---

**Pro Tip:** This extension is a great template! You can copy this structure to create extensions for other languages. Just swap out the tree-sitter grammar and LSP server. 🚀

