#!/usr/bin/env bash
# Stop Before Code (SBC) Quick Installer

set -e

echo "🛑 [Stop Before Code] Installing..."

PROJECT_DIR=$(pwd)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( dirname "$SCRIPT_DIR" )"

# 1. Cursor support
if [ -d "$PROJECT_DIR/.cursor" ] || [ -f "$PROJECT_DIR/.cursorrules" ] || [ "$1" == "--cursor" ]; then
    echo "📦 Detected Cursor project. Adding .cursorrules..."
    cp "$ROOT_DIR/adapters/.cursorrules" "$PROJECT_DIR/.cursorrules"
    echo "✅ .cursorrules generated in current directory!"
fi

# 2. Claude Code / Antigravity support
if [ -d "$HOME/.gemini/antigravity/skills" ]; then
    TARGET_DIR="$HOME/.gemini/antigravity/skills/stop-before-code"
    echo "📦 Linking to Antigravity global skills..."
    mkdir -p "$TARGET_DIR"
    cp -r "$ROOT_DIR/SKILL.md" "$ROOT_DIR/references" "$TARGET_DIR/"
    echo "✅ Skill installed to $TARGET_DIR"
fi

echo "🎉 [Stop Before Code] Successfully configured! No Spec, No Code."
