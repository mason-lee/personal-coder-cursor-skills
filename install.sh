#!/usr/bin/env bash
# Installs every skill in ./skills/ as a symlink under ~/.cursor/skills/.
#
# Run manually:
#     bash install.sh
#
# Coder's dotfiles feature will run this automatically when a workspace is
# created if this repo is set as the user's Dotfiles URL.
#
# Safe to re-run: existing symlinks are refreshed, real files/dirs with the
# same name are left alone and a warning is printed.

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$HERE/skills"
SKILLS_DST="$HOME/.cursor/skills"

if [ ! -d "$SKILLS_SRC" ]; then
    echo "error: $SKILLS_SRC does not exist" >&2
    exit 1
fi

mkdir -p "$SKILLS_DST"

installed=0
skipped=0

for skill_dir in "$SKILLS_SRC"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    target="$SKILLS_DST/$skill_name"

    if [ -L "$target" ]; then
        # Refresh existing symlink in case the source path changed.
        rm -f "$target"
    elif [ -e "$target" ]; then
        echo "skip: $target exists and is not a symlink — leaving untouched" >&2
        skipped=$((skipped + 1))
        continue
    fi

    ln -s "$skill_dir" "$target"
    echo "linked: $target -> $skill_dir"
    installed=$((installed + 1))
done

echo
echo "installed $installed skill(s), skipped $skipped"
