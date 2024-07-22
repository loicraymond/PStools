#####################################################################################################
# 
# Nom : SSH_Multi_commands.ps1
# Auteur : Loïc RAYMOND
# Date : 22/07/2024
# Description : Connexion SSH aux équipements pour modification/obtention d'informations en masse 
#
####################################################################################################

# J'importe le module Posh-SSH
Import-Module Posh-SSH

# J'efface le contenu de la console
Clear-Host

# Liste des IP (une ligne par IP)
$Fichier = "C:\temp\liste-ip.txt"

# Je demande la saisie des identifiants de connexion
$Identification = Get-Credential -Message "Saisissez les identifiants pour vous connecter aux équipements"

ForEach ($IP_Equipement in Get-Content $Fichier)
{
    # J'écris l'adresse IP
    Write-Host ("Connexion à : "+$IP_Equipement)
    
    # Je listes les commandes à effectuer à distance
    $Commandes = "conf t `n no banner login `n no banner exec `n exit `n wr `n"

    # Je lance une session SSH
    $SessionID = New-SSHSession -ComputerName $IP_Equipement -Credential $Identification -AcceptKey
    $STREAM = New-SSHShellStream -Index $SessionID.SessionId

    # Je lance les commandes à distance
    Invoke-SSHStreamShellCommand -ShellStream $STREAM -Command $Commandes

    # J'écris une ligne pour séparer
    Write-Host "----------------------------------"

    # Je ferme la session SSH
    Remove-SSHSession -SessionId $SessionID.SessionId
}
