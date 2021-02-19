#
# Nom : PersonalFolderButNoAccount
# Date : 24/01/2018
# Description : Liste les dossiers personnels existant alors qu'aucun compte n'existe dans l'AD
# 
Import-module ActiveDirectory

$Dossiers = Get-ChildItem -Path "\\fps\utilisateurs\" | Where-Object {$_.PSIsContainer}
Foreach($Rep in $Dossiers)
{
    $Repertoire = ($Rep.Name)
	$Utilisateurs = Get-ADUser -Filter {sAMAccountName -eq $Repertoire} -Properties *
    $samac = $Utilisateurs.sAMAccountName
    
    # Je teste si le répertoire personnel existe
    If($Repertoire -ne $samac)
    {
        Write-Host ("Le répertoire \\fps\utilisateurs\"+$Rep+" existe encore mais aucun utilisateur portant le login "+$Rep+" n'est pas présent dans l'AD")
    }
}