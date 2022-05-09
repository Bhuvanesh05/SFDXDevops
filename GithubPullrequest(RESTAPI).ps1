$pat = "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"
$header = @{Authorization = 'OAuth ' + $($pat)}#[Convert]ToBase64String([Text.Encoding]ASCII.GetBytes($($pat))) }
$url = "https://api.github.com/repos/Bhuvanesh05/Commands/pulls?state=all"
# write-host url  $url
$response = Invoke-RestMethod -Uri $url -Headers $header -Method Get
write-host $response[0]
$repname = $response[0].head.repo.name
write-host Repository Name$repname
 for ($i = 0; $i -lt $response.Count; $i++) {
    $build = $response[$i].id
    $pullnum = $response[$i].number
    $build1 = $response[$i].head.ref
    $build2 = $response[$i].base.ref
    $build3 = $response[$i].state
    $build4 = $response[$i].closed_at
    if(($build1 -eq 'sfdx') -and ($build2 -eq 'master'))
    {
        
      "    `n pull request ID$build  `n
               pull Number$pullnum  `n
               head branch(From)$build1  `n
               base branch(To)$build2 `n
               pull request Status$build3 `n
               pull request closed-Date$build4"
     }   
    
}