param(
    [string]
    $Resourcegroupname
)

#Get form recognizer workspace name
$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.CognitiveServices/accounts
$WorkSpacename = $WorkSpace.Name

#Get azure access token
$token = (Get-AzAccessToken).Token

#Get subscription Id
$subscriptionUri = "https://management.azure.com/subscriptions?api-version=2020-01-01"
$headers1 = @{ Authorization = "Bearer $token"; 'ContentType' = "application/json"}
$res1 = Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $subscriptionUri -Headers $headers1
$SubscriptionId = $res1.value[0].subscriptionId

#Get access key
$keyUri = "https://management.azure.com/subscriptions/"+$SubscriptionId+"/resourceGroups/"+$Resourcegroupname+"/providers/Microsoft.CognitiveServices/accounts/"+$WorkSpacename+"/listKeys?api-version=2021-10-01"
$headers2 = @{ Authorization = "Bearer $token"; 'ContentType' = "application/json"}
$res2 = Invoke-RestMethod -Method Post -ContentType "application/json" -Uri $keyUri -Headers $headers2

#Get custom models
$modelUri = "https://"+$WorkSpacename+".cognitiveservices.azure.com/formrecognizer/v2.0/custom/models?op=summary"
$headers3 = @{ Authorization = "Bearer $token"; 'Ocp-Apim-Subscription-Key' = $res2.key1}
$res3 = Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $modelUri -Headers $headers3

if($res3.summary.count -ge 2)
{
    Write-Host "Custom models are created"
}
else
{
    Write-Host "Custom models are not created"
}
