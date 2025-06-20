# Connexion à Exchange Online
Connect-ExchangeOnline

$BAL = Read-Host "Boite aux lettres"

# Activation de la copie des messages envoyés "en tant que"
Set-Mailbox $BAL -MessageCopyForSentAsEnabled $True
Set-Mailbox $BAL -MessageCopyForSendOnBehalfEnabled $True
