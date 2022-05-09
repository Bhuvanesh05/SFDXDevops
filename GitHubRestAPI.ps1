$pat = "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"
$header = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)")) }
#$url = "https://api.github.com/repos/Bhuvanesh05/Commands/pulls?state=all"
$url = "https://api.github.com/search/repositories"
#write-host "url : $url" 
$response = Invoke-RestMethod -Uri $url -Headers $header -Method Get
write-host "url : $response"
$repname = $response[0].head.repo.name
write-host "Repository Name:$repname"  
$Output = @()
foreach ($item in $response) {
    $Output = @{
        "Id" = "$item.id";
        "Client address" = "$item.url";
        "status" = "$item.state"
    } 
   
} 
$Output.GetEnumerator() | Sort-Object Id | Add-Content D:\log.txt