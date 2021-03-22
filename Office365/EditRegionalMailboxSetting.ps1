#
# Nom : EditRegionalMailboxSetting.ps1
# Date : 22/03/2021
#

# Connexion à Exchange Online
Connect-ExchangeOnline

$BAL = Read-Host "Boite aux lettres"

# Définition des paramètres de langue
Set-MailboxRegionalConfiguration -Identity $BAL -Language fr-FR -LocalizeDefaultFolderName
