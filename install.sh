#!/usr/bin/env bash
# Installs the global architect (and its skills) into ~/.claude.
# Project agents are NOT installed here: the architect adapts them per project.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
claude_dir="${HOME}/.claude"

mkdir -p "${claude_dir}/agents" "${claude_dir}/skills"

cp "${repo_dir}/global/arquiteto.md" "${claude_dir}/agents/arquiteto.md"
echo "ok: ${claude_dir}/agents/arquiteto.md"

for skill in "${repo_dir}"/global/skills/*/; do
    name="$(basename "${skill}")"
    mkdir -p "${claude_dir}/skills/${name}"
    cp -r "${skill}." "${claude_dir}/skills/${name}/"
    echo "ok: ${claude_dir}/skills/${name}"
done

if ! command -v gh >/dev/null 2>&1; then
    echo "aviso: instale o GitHub CLI (gh); o arquiteto usa ele para baixar o riddere."
elif ! gh auth status >/dev/null 2>&1; then
    echo "aviso: rode 'gh auth login' para o arquiteto conseguir baixar o riddere (privado)."
fi
