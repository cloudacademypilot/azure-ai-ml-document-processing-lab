param(
    [string] $ResourceGroupName,
    [string] $StorageAccountName
)

Write-Host "File uploading...."
Write-Host "RG: $($ResourceGroupName) | SA: $($StorageAccountName)"

$Uri = @(
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-test-dataset/test-invoice.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice1.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice2.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice3.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice4.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice5.pdf",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-test-dataset/filled-form.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form1.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form2.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form3.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form4.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form5.png",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/read-model-test-dataset/resume_example3.png"
);


$SrcFileName = @(
    "test-invoice.pdf",
    "invoice1.pdf",
    "invoice2.pdf",
    "invoice3.pdf",
    "invoice4.pdf",
    "invoice5.pdf",
    "filled-form.png",
    "form1.png",
    "form2.png",
    "form3.png",
    "form4.png",
    "form5.png",
    "resume_example3.png"
);
$DestFileName = @(
    "neural-model-test-dataset/test-invoice.pdf",
    "neural-model-training-dataset/invoice1.pdf",
    "neural-model-training-dataset/invoice2.pdf",
    "neural-model-training-dataset/invoice3.pdf",
    "neural-model-training-dataset/invoice4.pdf",
    "neural-model-training-dataset/invoice5.pdf",
    "template-model-test-dataset/filled-form.png",
    "template-model-training-dataset/form1.png",
    "template-model-training-dataset/form2.png",
    "template-model-training-dataset/form3.png",
    "template-model-training-dataset/form4.png",
    "template-model-training-dataset/form5.png",
    "read-model-test-dataset/resume_example3.png"

);
$DestContainer = "aimllabs";

try {
    $StorageAccountKey = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -Name $StorageAccountName;
    $Ctx = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey.Value[0];

    For($i=0; $i -lt $Uri.Length; $i++){
        Invoke-WebRequest -Uri $Uri[$i] -OutFile $SrcFileName[$i];
        Set-AzStorageBlobContent -File $SrcFileName[$i] -Container $DestContainer -Blob $DestFileName[$i] -Context $Ctx;    
    }

    Write-Host "Files uploaded"
}
catch {
    Write-Host 'Something went wrong'
    Write-Host $_
}

