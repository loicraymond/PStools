$group = Read-Host "Dynamic Distribution Group Address"
Get-Recipient -RecipientPreviewFilter (Get-DynamicDistributionGroup $group).RecipientFilter
