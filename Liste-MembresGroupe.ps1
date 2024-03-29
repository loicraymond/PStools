<#
Auteur : Loïc RAYMOND
Date : 07/01/2020
Description : Script permettant d'obtenir la liste des utilisateurs membres d'un groupe AD
#>

import-module ActiveDirectory
Clear-Host
$Groupe = Read-Host "Veuillez saisir le nom du groupe"
$listemembre = $NULL
Clear-Host

$NomAleatoire = Get-Random -Maximum 100000

$AD = Get-ADGroup -Filter {Name -like $Groupe} 
Foreach($grp in $AD)
{		
	# J'obtiens la listes des membres du Groupe
	$ADG = Get-ADGroupMember -identity $grp -Recursive 
	Foreach($membre in $ADG)
	{
        # Je liste les noms et prénoms des membres du groupe
		$listemembre = $membre.name
        
        # J'ajoute le contenu dans un fichier texte
        Add-Content -Path ($env:TEMP+"\"+$NomAleatoire+".txt") -Value $($listemembre)
	}
}


# J'ouvre le bloc notes avec le fichier créé
notepad.exe ($env:TEMP+"\"+$NomAleatoire+".txt")

# J'attend 5 secondes
Start-Sleep 5

# Je supprime le fichier texte
Remove-Item -Path ($env:TEMP+"\"+$NomAleatoire+".txt")