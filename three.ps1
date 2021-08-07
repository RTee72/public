$users=import-csv users.csv
$a=Compare-Object $users.emailaddress $users.userprincipalname
$a.count