param(
    [string] $ResourceGroupName,
    [string] $StorageAccountName
)

Write-Host "File uploading...."
Write-Host "RG: $($ResourceGroupName) | SA: $($StorageAccountName)"

$Uri = "https://sa1ahoode.blob.core.windows.net/form-recognizer-assets/sample-invoice1.pdf";
$SrcFileName = "sample-invoice1.pdf";
$DestFileName = "sample-invoice1.pdf";
$DestContainer = "test-upload-script";

try {
    $StorageAccountKey = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -Name $StorageAccountName;
    $Ctx = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey.Value[0];
    Invoke-WebRequest -Uri $Uri -OutFile $SrcFileName;
    Set-AzStorageBlobContent -File $SrcFileName -Container $DestContainer -Blob $DestFileName -Context $Ctx;
    Write-Host "File uploaded"
}
catch {
    Write-Host 'Something went wrong'
    Write-Host $_
}

