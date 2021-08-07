########## The following is a test command to use this function : get-sitemailboxes users.csv TOR Employee

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
