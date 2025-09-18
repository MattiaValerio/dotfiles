# ===============================
# PowerShell Profile
# ===============================
# Questo file viene eseguito automaticamente ad ogni avvio di PowerShell.
# Serve per personalizzare l'ambiente con moduli, keybindings, alias e prompt.

# -------------------------------
# Caricamento moduli
# -------------------------------
# Importa il modulo Terminal-Icons se è installato (mostra icone nelle liste di file/cartelle)
if (Get-Module -ListAvailable -Name Terminal-Icons) {
    Import-Module Terminal-Icons
}

# Importa il modulo PSReadLine se disponibile (migliora l'editing della linea di comando, autocompletamento, cronologia)
if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
}

# -------------------------------
# Configurazione tasti rapidi (PSReadLine)
# -------------------------------
# Premendo Tab accetta il suggerimento di autocompletamento
Set-PSReadLineKeyHandler -Chord Tab        -Function AcceptSuggestion

# Premendo la freccia → accetta una parola alla volta dal suggerimento
Set-PSReadLineKeyHandler -Chord RightArrow -Function ForwardWord

# Freccia ↑ ricerca comandi precedenti che iniziano come quello digitato
Set-PSReadLineKeyHandler -Key UpArrow      -Function HistorySearchBackward

# Freccia ↓ ricerca comandi successivi nella cronologia
Set-PSReadLineKeyHandler -Key DownArrow    -Function HistorySearchForward

# -------------------------------
# Prompt personalizzato (oh-my-posh)
# -------------------------------
# Inizializza oh-my-posh con la configurazione personalizzata (.json accanto al profilo)
oh-my-posh --init --shell pwsh --config "$PROFILE/../ohmyposh-v1.json" | Invoke-Expression

# -------------------------------
# Pulizia schermo
# -------------------------------
# Cancella il testo mostrato all'avvio (banner di PowerShell)
Clear-Host

# -------------------------------
# Alias e funzioni personalizzate
# -------------------------------
# ll -> equivalente di Get-ChildItem (lista file e cartelle, come "ls -l" su Linux)
Set-Alias ll Get-ChildItem

# gs -> scorciatoia per "git status"
function gs { git status }

# ga -> Git Add
function ga  { git add $args }

# gcm -> scorciatoia per "git commit -m"
function gcm { git commit @args }

# gpsh -> Push
function gpsh { git push $args }

# Log compatto
function gl  { git log --oneline --graph --decorate --all }

# Pull
function gpl { git pull $args }

# c -> scorciatoia per "clear"
function c { clear }

# q -> scorciatoia per "exit"
function q { exit }

# exp -> apre la cartella corrente nell'explorer
function exp { explorer . }