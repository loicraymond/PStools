#--------------------------------------------
#
# Nom : CheckBackup.ps1
# Date : 29/10/2021
# Auteur : Loïc RAYMOND
# Description : Vérification du bon déroulement des sauvegardes Windows Backup via WhatsUpGold (Script à adapter pour l'utiliser manuellement)
# 
#--------------------------------------------

$ErrorActionPreference = "SilentlyContinue"

$Utilisateur = $Context.GetProperty("CredWindows:DomainAndUserid")
$Pass = $Context.GetProperty("CredWindows:Password")
$MotDePasse = ConvertTo-SecureString -AsPlainText $Pass -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Utilisateur,$MotDePasse
$Serveur = $Context.GetProperty("Address")

Invoke-Command -ComputerName $Serveur -Credential $Cred -ScriptBlock {

$NULL = ""
#$Date = (Get-Date).AddDays(-2)
$Date = (Get-Date).AddHours(-4)
    
# Je récupère les évènements portant l'ID = 8
$Event = Get-WinEvent -Path "C:\Windows\System32\Winevt\Logs\Microsoft-Windows-Backup.evtx" | Where-Object {$_.TimeCreated -ge $Date -and $_.Id -eq "8" -or $_.Id -eq "5" -or $_.Id -eq "51" } | Select-Object -First 1

If($Event -ne $NULL)
{
    # Je formate la date
    $DateF = ($Event.Timecreated).tostring(“dd-MM-yyyy HH:mm”)
    $Resultat = ($DateF+" --> "+$Event.Message)
    $Etat = 0
}
Else
{
    $Etat = 1
    $Resultat = "RAS"
}
}
$Context.SetResult($Etat,$Resultat);
