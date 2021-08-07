$users=import-csv users.csv
$sum = 0
$users.MailboxSizeGB | Foreach { $sum += $_}
$sum 