Get-DistributionGroupMember "group@domain.tld" | Select Name,PrimarySmtpAddress | Export-Csv c:\Temp\group-members.csv -NoTypeInformation
