#!/usr/bin/env bash

set -e

echo "🚀 Installazione di Oh My Posh su Windows..."

# Detect package manager (winget o scoop o choco)
if command -v winget >/dev/null 2>&1; then
    echo "👉 Uso winget"
    winget install --id JanDeDobbeleer.OhMyPosh -e --source winget
elif command -v scoop >/dev/null 2>&1; then
    echo "👉 Uso scoop"
    scoop install oh-my-posh
elif command -v choco >/dev/null 2>&1; then
    echo "👉 Uso Chocolatey"
    choco install oh-my-posh -y
else
    echo "⚠️ Nessun package manager trovato (winget/scoop/choco)."
    echo "Installane uno e rilancia lo script."
    exit 1
fi

# Installa Nerd Fonts (Meslo come esempio)
if command -v winget >/dev/null 2>&1; then
    echo "👉 Installo Nerd Font (Meslo)"
    winget install --id NerdFonts.Meslo -e --source winget
else
    echo "⚠️ Installazione font automatica non supportata senza winget."
    echo "Scarica manualmente da: https://www.nerdfonts.com/font-downloads"
fi

# Configurazione PowerShell (se esiste)
if [ -d "$HOME/Documents/PowerShell" ]; then
    PROFILE_PATH="$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
    echo "👉 Configuro PowerShell profile in: $PROFILE_PATH"
    mkdir -p "$(dirname "$PROFILE_PATH")"
    if ! grep -q "oh-my-posh init pwsh" "$PROFILE_PATH" 2>/dev/null; then
        echo 'oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression' >> "$PROFILE_PATH"
    fi
fi

echo "✅ Installazione completata!"
echo "Apri PowerShell e assicurati di selezionare il font Nerd Font (es. Meslo) nelle impostazioni del terminale."
