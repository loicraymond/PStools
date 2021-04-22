Get-Mailbox | ? {$_.ForwardingSmtpAddress -ne $null} | FT Name, ForwardingSmtpAddress,DeliverToMailboxandForward
