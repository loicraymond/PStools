$name = Read-Host "Name"
$smtpadd = Read-Host "SMTP Address"
New-DynamicDistributionGroup -Name $name -IncludedRecipients "MailboxUsers" -PrimarySmtpAddress $smtpadd
