Set-PSReadLineKeyHandler -Chord "Tab" -Function AcceptSuggestion # Accetta il suggerimento di autocompletamento con TAB
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord # Accetta una parola alla volta con il tasto →


oh-my-posh --init --shell pwsh --config "$PROFILE/../ohmyposh-v1.json" | Invoke-Expression
Import-Module -Name Terminal-Icons


Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
