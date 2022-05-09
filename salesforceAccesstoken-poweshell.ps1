##Generate the salesforce  
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://login.salesforce.com/services/oauth2/token"
#$tokenurl = [System.Web.HttpUtility]::UrlEncode($url)
$postParams = @{
    grant_type    = "password";
    client_id     = "3MVG9pRzvMkjMb6m1QPIFMudXWT5BnSpe8r._hT_ybwiW879HMK94vNsmzlrHxMj7.YQc_6d0RO4UrTl0Ej09";
    client_secret = "73EE65AD8E6120F30738AD62422053D17D821E24CB9BCFE036AAFF71CC0D2DA5";
    username      = "kumarbhuvanesh625@resourceful-raccoon-1fy2x0.com";
    password      = "Bhuvakies@321PW8XyERf7e8isfmalaBGbDlL";
}
#$contenttype = "application/json"
$result = Invoke-RestMethod -Uri $url -Method POST -Body $postParams 
Write-host  $result.access_token

##Implement the RestAPI Method
$access_token = "00D5j000005IKPQ!ARAAQEyHvcSnuuOWWz6bp4qAO4jyBuXaWlL_BuQpXw0FWAqBgiwLI6Rt6B0z.9ZTkUUCi_nmJsDwpWRQDwqlVttI6EHBlyX8"
$header = @{"Authorization" = "OAuth " + "$($access_token)" }
# $name1= "Bhuvaneshkumar"
# $accname = "Account"
$url = "https://resourceful-raccoon-1fy2x0-dev-ed.my.salesforce.com/services/data/v53.0/limits"
# $bod =@{
#     Name = $name1
# }
# $bod1 = $bod | ConvertTo-Json
# #Write-Host $bod1
$contenttype = "application/json"
$res=Invoke-RestMethod -Uri $url -Headers $header -contenttype $contenttype -Method Get #-Body $bod1
Write-Host $res