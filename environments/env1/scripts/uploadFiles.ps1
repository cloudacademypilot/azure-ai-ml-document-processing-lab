param(
    [string] $ResourceGroupName,
    [string] $StorageAccountName
)

Write-Host "File uploading...."
Write-Host "RG: $($ResourceGroupName) | SA: $($StorageAccountName)"

$Uri = @(
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-test-dataset/test-invoice.pdf?sp=r&st=2023-01-06T18:23:04Z&se=2023-01-14T02:23:04Z&spr=https&sv=2021-06-08&sr=b&sig=y9arnehoC%2BcN668DPmevqwa7DSgHZ%2BCYXG1UcZjWV0c%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice1.pdf?sp=r&st=2023-01-06T18:26:42Z&se=2023-01-14T02:26:42Z&spr=https&sv=2021-06-08&sr=b&sig=bMDH2JlirW6MJv4h03gg1EigjiWhpCn1LJyoXqrtIfA%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice2.pdf?sp=r&st=2023-01-06T18:27:27Z&se=2023-01-14T02:27:27Z&spr=https&sv=2021-06-08&sr=b&sig=qfXTdi2lvrtd%2FQXcpkiiU4wqE8aNa63fZ4xn8%2BKr2ys%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice3.pdf?sp=r&st=2023-01-06T18:28:02Z&se=2023-01-14T02:28:02Z&spr=https&sv=2021-06-08&sr=b&sig=WSjNWNDpZrFz0toNCrJeCcaZRINPzwuaDjD5BVEkH04%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice4.pdf?sp=r&st=2023-01-06T18:28:43Z&se=2023-01-14T02:28:43Z&spr=https&sv=2021-06-08&sr=b&sig=JQ%2FZqL8k9GrYFbANLguCeFNqngAMp9ZUeHzwv%2BfaNTQ%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/neural-model-training-dataset/invoice5.pdf?sp=r&st=2023-01-06T18:29:25Z&se=2023-01-14T02:29:25Z&spr=https&sv=2021-06-08&sr=b&sig=LXy3%2B1IOC3zKrOUA1HJmlwUpZDW0wVgSrng5RLyjrbU%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-test-dataset/filled-form.png?sp=r&st=2023-01-06T18:30:56Z&se=2023-01-14T02:30:56Z&spr=https&sv=2021-06-08&sr=b&sig=FEb5GUI1gkIy4jViI6HxQsIpj7j0E1abQk9wWsDpt8g%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form1.png?sp=r&st=2023-01-06T18:31:36Z&se=2023-01-14T02:31:36Z&spr=https&sv=2021-06-08&sr=b&sig=b5zo85sdJvH63iuy%2BuZ3YH0uNC6csoTAuUgdeRLHtSg%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form2.png?sp=r&st=2023-01-06T18:32:04Z&se=2023-01-14T02:32:04Z&spr=https&sv=2021-06-08&sr=b&sig=HOALnI8pFL0JgtRAVk6d8Sa8PPEh7USls9JrvvSrigE%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form3.png?sp=r&st=2023-01-06T18:32:29Z&se=2023-01-14T02:32:29Z&spr=https&sv=2021-06-08&sr=b&sig=Na1G6APyN6XY76qfeS6ZVbyFkRYONrDchBpP5fDgOjc%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form4.png?sp=r&st=2023-01-06T18:33:02Z&se=2023-01-14T02:33:02Z&spr=https&sv=2021-06-08&sr=b&sig=6dFttgJ1V73Rkv%2B84Izbf0K2uY4LwMg8Fw5NaXAEyXA%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/template-model-training-dataset/form5.png?sp=r&st=2023-01-06T18:34:10Z&se=2023-01-14T02:34:10Z&spr=https&sv=2021-06-08&sr=b&sig=nLTHyZa3h8eK7QZBeltVrW7BKEsru%2BE1jIT5%2BCg6QHo%3D",
    "https://csalabsshrdstrg1.blob.core.windows.net/aimllabs/read-model-test-dataset/resume_example3.png?sp=r&st=2023-01-06T18:30:00Z&se=2023-01-14T02:30:00Z&spr=https&sv=2021-06-08&sr=b&sig=FntDtGHHvzdj%2BylZuMXLRCXHVbDD7sccEULq6iZXPbM%3D"
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

