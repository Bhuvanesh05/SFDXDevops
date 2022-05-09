$pat = "2o2wtvgevkd6ssz7tsg5lcfhi2m74cixt6zirqwcldeuxc66qjnq"
$header = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)")) }
$url = "https://dev.azure.com/aeroadithiyan3/SalesforceDevops-Training/_apis/build/builds?definitions=10&resultFilter=succeeded&api-version=5.0-preview.2"
write-host "url : $url" 
$response = Invoke-RestMethod -Uri $url -Headers $header -Method Get
$build = $response.value
$logicId = $build[0].sourceVersion
write-host "result:$logicId"