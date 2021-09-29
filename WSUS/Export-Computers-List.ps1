[reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration") 
 
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer() 
 
$FichierListe = "./liste-wsus.csv"

Clear-Host

foreach( $group in $wsus.GetComputerTargetGroups()) 
{ 

    $GRPnom = $group.Name 
    foreach ($pc in $group.GetComputerTargets())
    {
        $Hote = $pc.FullDomainName
        $OS = $pc.ClientVersion
        $OSD = $pc.OSDescription
        if($GRPnom -ne "All Computers")
        {
            $ContenuFichier = $Hote+","+$OSD+","+$GRPnom
            Add-Content $FichierListe $ContenuFichier
            Write-Host $ContenuFichier
        }
    }
}
