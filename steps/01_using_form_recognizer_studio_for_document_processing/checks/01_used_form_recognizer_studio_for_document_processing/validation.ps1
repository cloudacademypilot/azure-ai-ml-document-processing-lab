param(
    [string]
    $Resourcegroupname
)

$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.CognitiveServices/accounts
$WorkSpacename = $WorkSpace.Name

Write-Host $WorkSpacename

if($WorkSpacename){
    Write-Host "Form recognizer is created"
}
else{
    Write-Host "Form recognizer is not created"
}
