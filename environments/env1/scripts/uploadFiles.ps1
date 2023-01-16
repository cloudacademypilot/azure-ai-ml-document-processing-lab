param(
    [string] $ResourceGroupName,
    [string] $StorageAccountName
)

Write-Host "File uploading...."
Write-Host "RG: $($ResourceGroupName) | SA: $($StorageAccountName)"

$Uri = @(
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-test-dataset/test-invoice.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-training-dataset/invoice1.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-training-dataset/invoice2.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-training-dataset/invoice3.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-training-dataset/invoice4.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/neural-model-training-dataset/invoice5.pdf?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-test-dataset/filled-form.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-training-dataset/form1.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-training-dataset/form2.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-training-dataset/form3.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-training-dataset/form4.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/template-model-training-dataset/form5.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D",
    "https://mscalabshare.blob.core.windows.net/artifacts/aiml/read-model-test-dataset/resume_example3.png?sp=r&st=2023-01-16T19:05:44Z&se=2099-01-17T03:05:44Z&spr=https&sv=2021-06-08&sr=c&sig=nmGla%2BledSv8IeNjZoY5zVeRQq3uYtvIJr00rh9x5%2Fk%3D"
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
$DestContainer = "fr-datasets";

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

