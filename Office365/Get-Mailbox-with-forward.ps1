# Connexion à Exchange Online
Connect-ExchangeOnline

# Liste des boites aux lettres avec un transfert
Get-Mailbox | ? {$_.ForwardingSmtpAddress -ne $null} | FT Name, ForwardingSmtpAddress,DeliverToMailboxandForward
