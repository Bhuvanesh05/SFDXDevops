$pat = "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"
$header = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)")) }
$url = "https://api.github.com/repos/Bhuvanesh05/Commands/pulls?state=all"
write-host "url : $url" 
$response = Invoke-RestMethod -Uri $url -Headers $header -Method Get

$repname = $response[0].head.repo.name
write-host "Repository Name:$repname"   
$output = for ($i = 0; $i -lt $response.Count; $i++) {
    $build = $response[$i].id
    $pullnum = $response[$i].number
    $build1 = $response[$i].head.ref
    $build2 = $response[$i].base.ref
    $build3 = $response[$i].state
    if(($build1 -eq 'sfdx') -and ($build2 -eq 'master'))
    {
        "  `r`n pull request ID:$build  `r`n
               pull Number:$pullnum  `r`n
               head branch(From):$build1  `r`n
               base branch(To):$build2 `r`n
               pull request Status:$build3"
        #write-host "pull request Status:$build3"
      #  write-host "head branch:$build1"
       # write-host "base branch:$build2"
     }   
     Get-Content | Select-Object * -Variable ExportMe 
}
$ExportMe | Export-Csv -Path D:\Listofpull.csv -NoTypeInformation