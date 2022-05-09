$access_token = "00D5j000005IKPQ!ARAAQGLB2oKawkogYcgH1MKbAFhLpvRK9o4K5vD3NUZQxIXvbqh..t8Xj6Eg4VQDBEgpRkGt5z5A9CpcILbvVcfdA5bG4ODj"
#$user = "kumarbhuvanesh625@resourceful-raccoon-1fy2x0.com"
#$token = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $personalToken)))
$header = @{"Authorization" = "OAuth " + $access_token }
#$username = "kumarbhuvanesh625@empathetic-badger-nug693.com"
#$password = "Bhuvakies@321"
$URI = "https://resourceful-raccoon-1fy2x0-dev-ed.my.salesforce.com/services/data/v53.0/limits"
$method = "GET"
$contenttype = "application/json"
$response = Invoke-restmethod -URI $URI -contenttype $contenttype -Headers $header -Method $method
$name ="  hii"
$name = $name.trim()
$name = "'$name'"
write-host $name