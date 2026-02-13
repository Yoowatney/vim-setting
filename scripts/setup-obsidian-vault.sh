#!/bin/bash
# setup-obsidian-vault.sh
# 새 기기에서 Obsidian vault symlink 설정

VAULT_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-munice"
MUNICE_PATH="$HOME/work/munice"

# Vault 존재 확인
if [ ! -d "$VAULT_PATH" ]; then
    echo "Error: Obsidian vault not found at $VAULT_PATH"
    echo "Please sync iCloud first."
    exit 1
fi

# symlink 생성 함수
create_symlink() {
    local target=$1
    local link=$2

    if [ -L "$link" ]; then
        echo "Symlink already exists: $link"
    elif [ -d "$link" ]; then
        echo "Warning: $link is a directory. Skipping."
        echo "  Remove it manually if you want to create symlink."
    else
        ln -s "$target" "$link"
        echo "Created: $link -> $target"
    fi
}

# symlink 설정
create_symlink "$VAULT_PATH/api" "$MUNICE_PATH/nightly_api/docs"
create_symlink "$VAULT_PATH/cloud-functions" "$MUNICE_PATH/cloud-functions/docs"
create_symlink "$VAULT_PATH/terraform" "$MUNICE_PATH/terraform/docs"
create_symlink "$VAULT_PATH/backlog" "$MUNICE_PATH/docs"

echo "Done! Obsidian vault symlinks configured."
