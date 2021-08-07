Function Get-SiteMailboxes()
{
    param
    (
        [Parameter(Mandatory=$true)] [string] $Inputfile,
        [Parameter(Mandatory=$true)] [string] $Site,
        [Parameter(Mandatory=$true)] [string] $Accounttype 
         )
$ans={}
$ans2={}
$ans3={}
$error="error"

$users=import-csv $Inputfile




$User_site = $users | Where-Object { $_.Site -eq $Site }
$User_Accounttype = $User_site | Where-Object { $_.Accounttype -eq $Accounttype }
$Ans=$User_AccountType
$Ans2=$User_site = $users | Where-Object { $_.Site -eq $Site }
$Ans3=$Ans2

If ($Accounttype -eq "All") 
{ $Ans3 }  


If (($Accounttype -eq "Employee") -or ($Accounttype-eq "Contractor")) 
{

$Ans 

}


If (($Accounttype -ne "Employee") -and ($Accounttype-ne "Contractor") -and ($Accounttype -ne "All" ) ) 
{$error}


}


$R1=import-csv reportblank.csv
$R2=$R1

$BOS=(Get-SiteMailboxes users.csv BOS All)
$BRZ=(Get-SiteMailboxes users.csv BRZ All)
$LAS=(Get-SiteMailboxes users.csv LAS All)
$NYC=(Get-SiteMailboxes users.csv NYC All)
$RIO=(Get-SiteMailboxes users.csv RIO All)
$SEA=(Get-SiteMailboxes users.csv SEA All)
$TOR=(Get-SiteMailboxes users.csv TOR All)

$R2 |foreach{if($_.Site -eq "BOS"){$_.TotalUserCount = $BOS.count}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.TotalUserCount = $BRZ.count}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.TotalUserCount = $LAS.count}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.TotalUserCount = $NYC.count}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.TotalUserCount = $RIO.count}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.TotalUserCount = $SEA.count}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.TotalUserCount = $TOR.count}}



$BOS_E=(Get-SiteMailboxes users.csv BOS Employee)
$BRZ_E=(Get-SiteMailboxes users.csv BRZ Employee)
$LAS_E=(Get-SiteMailboxes users.csv LAS Employee)
$NYC_E=(Get-SiteMailboxes users.csv NYC Employee)
$RIO_E=(Get-SiteMailboxes users.csv RIO Employee)
$SEA_E=(Get-SiteMailboxes users.csv SEA Employee)
$TOR_E=(Get-SiteMailboxes users.csv TOR Employee)

$R2 |foreach{if($_.Site -eq "BOS"){$_.EmployeeCount = $BOS_E.count}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.EmployeeCount = $BRZ_E.count}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.EmployeeCount = $LAS_E.count}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.EmployeeCount = $NYC_E.count}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.EmployeeCount = $RIO_E.count}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.EmployeeCount = $SEA_E.count}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.EmployeeCount = $TOR_E.count}}

$BOS_C=(Get-SiteMailboxes users.csv BOS Contractor)
$BRZ_C=(Get-SiteMailboxes users.csv BRZ Contractor)
$LAS_C=(Get-SiteMailboxes users.csv LAS Contractor)
$NYC_C=(Get-SiteMailboxes users.csv NYC Contractor)
$RIO_C=(Get-SiteMailboxes users.csv RIO Contractor)
$SEA_C=(Get-SiteMailboxes users.csv SEA Contractor)
$TOR_C=(Get-SiteMailboxes users.csv TOR Contractor)


$R2 |foreach{if($_.Site -eq "BOS"){$_.ContractorCount = $BOS.count-$BOS_E.count}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.ContractorCount = $BRZ_C.count}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.ContractorCount = $LAS_C.count}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.ContractorCount = $NYC_C.count}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.ContractorCount = $RIO_C.count}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.ContractorCount = $SEA_C.count}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.ContractorCount = $TOR_C.count}}

$sum_BOS = 0
$BOS.MailboxSizeGB | Foreach { $sum_BOS += $_}
$sum_BRZ = 0
$BRZ.MailboxSizeGB | Foreach { $sum_BRZ += $_}
$sum_LAS = 0
$LAS.MailboxSizeGB | Foreach { $sum_LAS += $_}
$sum_NYC = 0
$NYC.MailboxSizeGB | Foreach { $sum_NYC += $_}
$sum_RIO = 0
$RIO.MailboxSizeGB | Foreach { $sum_RIO += $_}
$sum_SEA = 0
$SEA.MailboxSizeGB | Foreach { $sum_SEA += $_}
$sum_TOR = 0
$TOR.MailboxSizeGB | Foreach { $sum_TOR += $_}



$R2 |foreach{if($_.Site -eq "BOS"){$_.TotalMailboxSizeGB = $sum_BOS}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.TotalMailboxSizeGB = $sum_BRZ}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.TotalMailboxSizeGB = $sum_LAS}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.TotalMailboxSizeGB = $sum_NYC}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.TotalMailboxSizeGB = $sum_RIO}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.TotalMailboxSizeGB = $sum_SEA}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.TotalMailboxSizeGB = $sum_TOR}}


#AverageMailboxSizeGB
#[math]::Round($a,2)

#$sum_BOS/$BOS.count
#$y=($sum_BOS/$BOS.count)
#$z=[MATH]::Round($R3.AverageMailboxSizeGB[0],1)
#$z



$R2 |foreach{if($_.Site -eq "BOS"){$_.AverageMailboxSizeGB = $sum_BOS/$BOS.count}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.AverageMailboxSizeGB = $sum_BRZ/$BRZ.count}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.AverageMailboxSizeGB = $sum_LAS/$LAS.count}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.AverageMailboxSizeGB = $sum_NYC/$NYC.count}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.AverageMailboxSizeGB = $sum_RIO/$RIO.count}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.AverageMailboxSizeGB = $sum_SEA/$SEA.count}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.AverageMailboxSizeGB = $sum_TOR/$TOR.count}}
$R2 |Export-CSV report.csv

$R3 =Import-CSV report.csv

$R2 |foreach{if($_.Site -eq "BOS"){$_.AverageMailboxSizeGB =[MATH]::Round($R3.AverageMailboxSizeGB[0],1)}}
$R2 |foreach{if($_.Site -eq "BRZ"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[1],1)}}
$R2 |foreach{if($_.Site -eq "LAS"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[2],1)}}
$R2 |foreach{if($_.Site -eq "NYC"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[3],1)}}
$R2 |foreach{if($_.Site -eq "RIO"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[4],1)}}
$R2 |foreach{if($_.Site -eq "SEA"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[5],1)}}
$R2 |foreach{if($_.Site -eq "TOR"){$_.AverageMailboxSizeGB = [MATH]::Round($R3.AverageMailboxSizeGB[6],1)}}

$R2 |Export-CSV report.csv

#$R2

