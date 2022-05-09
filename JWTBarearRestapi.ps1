##Generate the salesforce  
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://login.salesforce.com/services/oauth2/token"
#$tokenurl = [System.Web.HttpUtility]::UrlEncode($url)
$jwtheader=@{alg= "RS256"}
$jwtheader = $jwtheader | ConvertTo-Json
##converting the jwtheader to base64 string
#$jwtheader= [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$jwtheader"))
# $bytes = [System.Text.Encoding]::Unicode.GetBytes($jwtheader)
# $jwtheader = [System.Convert]::ToBase64String($bytes)
#$jwtheader = [uri]::EscapeDataString($base64)
Write-Host $jwtheader
$jwrclaim=@{iss= "3MVG9pRzvMkjMb6m1QPIFMudXWYe1wr14B.nH7_bgHZKJUaPjDaEmLrPzTOkW5IEJ5YlbVpIOt.DBFJJTxcZl"
        sub= "kumarbhuvanesh625@resourceful-raccoon-1fy2x0.com"
        aud= "https://login.salesforce.com"
exp= "1661064590"}  
##converting the jwtclaim to base64 string
$jwrclaim = $jwrclaim | ConvertTo-Json
$jwrclaim= [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$jwrclaim"))
# $bytes = [System.Text.Encoding]::Unicode.GetBytes($jwrclaim)
# $jwrclaim = [System.Convert]::ToBase64String($bytes)
# $jwrclaim = [uri]::EscapeDataString($base64)
Write-Host $jwrclaim
# $secretpub ="-----BEGIN PUBLIC KEY-----
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzJFlnQlJOZ1ntbVjtRBL
# 7moTrisr988g7koIogQx+0imMpUBQkUvnVJxJG16qmosBVKqJH9EAK8jcGnx+yas
# 0d/Muc01uN+C1JC4Y+p95fZMxY/IuO/Lz16+nHId0tdC4xPyXnf5Ketqc5sjTV3w
# uUVvjlaKAvR7t2/neUAFGH9lVD3oCVmT+48a1+wDCJs1mL9rewJDgrDD8R4kaTX7
# 1bINnStM5Tbbufg8L2GSJ9EugcvzHbUAofJx9l7ohX6BePSFqr0X2fJCN7dPspqF
# t9EavZYcHq87aQ6zIBFmPXnNCn4VthQY3B5o2+dGxaQpunTSZ1hvxwRPJR3/aDXX
# DwIDAQAB
# -----END PUBLIC KEY-----"
# $secret = "-----BEGIN RSA PRIVATE KEY-----
# MIIEpAIBAAKCAQEAzJFlnQlJOZ1ntbVjtRBL7moTrisr988g7koIogQx+0imMpUB
# QkUvnVJxJG16qmosBVKqJH9EAK8jcGnx+yas0d/Muc01uN+C1JC4Y+p95fZMxY/I
# uO/Lz16+nHId0tdC4xPyXnf5Ketqc5sjTV3wuUVvjlaKAvR7t2/neUAFGH9lVD3o
# CVmT+48a1+wDCJs1mL9rewJDgrDD8R4kaTX71bINnStM5Tbbufg8L2GSJ9Eugcvz
# HbUAofJx9l7ohX6BePSFqr0X2fJCN7dPspqFt9EavZYcHq87aQ6zIBFmPXnNCn4V
# thQY3B5o2+dGxaQpunTSZ1hvxwRPJR3/aDXXDwIDAQABAoIBAQDMByflm+FgiVFq
# teMgL4TL4RiH2Z8cpYUepNA/ZxfCnA7G3D5JLl/y9MrLnjV9yi7lkDEJ/bSBSix6
# bfBeoZA0MpYpqjYukR4Xi8+cN8Ahn6mqUWHMsb4AsWpC9r4wD2oyuS4+ckIcQSQG
# 8XAgNdVls48z07QKhnTt27puACAU8Q+GA4qIA3quKZTNeXnTgkqg57mcQK4fHyxu
# QBu6ssDaY+ezaEjmLc1hrAP3UJaTmo+F9O0tg7S1+EHDMcyEpiy7M3axwwZLuucP
# XT7gXgFuaCN/p1vsRoXlX4W5RRyV3jFyDDYTxitvD3OT0H1Wi9vQwE0InNPma+zJ
# 5he4jLYBAoGBAP+NFW1Ax3d2KBia6tkYs6Oj9xWpSRFIollL82m/OUajyCAIFDjS
# nfAB0o4HzqvT2mwHrRc+Sxi3BMY9rtDFaDTpvde495Z2QRGqKOWre6AMIBIhhMwV
# BlwEfq9iqf9l4NQ7KDzmXCzk2NoBzEezeX8el24vMhwjT5JGPhurtN5BAoGBAMzt
# YxmfvKprGRLpJovAo7I3QqV7RNGpX+nZNSewbo4ihtTpM5ruviEok9KErOXnfL1e
# K6FRocM4mOMGZL1o8Q4n6RPpDe3955pSWlTLPcifw3MTzufYBRMrdDn5DKQBtn1U
# IWl06qraSzQBzZnrK0SmwJcVaSABxBv89ThyxwFPAoGBALRaMYEFcsCQlwOmcY/9
# quoWUc7rxjF4fXtf6s36ssVz2U0h5oOjwOsdnie2wtjpjwEm+bWptP4gTDJMXg/h
# AgY14FFarQF3O7znxi0wtPLjG88v8LTHMdHHKlFE5IzmraGajm9MdEkKyTAyjKUd
# uOVKBb0xeb/5+7JT+Ik2yVMBAoGAdw53o7xtBOlh0N3Juim6MODwBGogalqn0ZmS
# yzMyl7sxcGLny1xm86a6cvUH6i3aB769RGTDwUKReFwPjQd5/MptHFcq85iuxLaR
# qm/FvlgrWiEo9QNIt4FobgHmOSaRmjCVlMoLSCW4yUc+5ux8386tV1lmEOVVxRjq
# ctgkC/sCgYB+5gSoQOfv1bqE8LjsDmOeX0ejbGyneVqG4q8BaAJ6AdezLz7VQoWm
# gm1d+cxTPNEiq0KjNWhCd14gXxGb6aDBfp7IXRr+nweZPRw25206eINiyeW9JCVs
# ShAp373CGznowUjIMu/721g/DkBKVJWbHSY52zB1o3IgvgWoP74/PQ==
# -----END RSA PRIVATE KEY-----"

# $privatekey=RSASHA256(   
#     $jwtheader + "." +   
#    $jwrclaim,$secretpub,$secret
# )
#  Write-Host $privatekey
$jwt = $jwtheader + '.' + $jwrclaim + '.' + $privatekey# The first part of the JWT
Write-Host $jwt
$url = "https://login.salesforce.com/services/oauth2/token"
$jwt = "eyJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJodHRwczovL2xvZ2luLnNhbGVzZm9yY2UuY29tIiwiaXNzIjoiM01WRzlwUnp2TWtqTWI2bTFRUElGTXVkWFdZZTF3cjE0Qi5uSDdfYmdIWktKVWFQakRhRW1MclB6VE9rVzVJRUo1WWxiVnBJT3QuREJGSkpUeGNabCIsInN1YiI6Imt1bWFyYmh1dmFuZXNoNjI1QHJlc291cmNlZnVsLXJhY2Nvb24tMWZ5MngwLmNvbSIsImV4cCI6IjE2NjEwNjQ1OTAifQ.XQxoMJrrZj8pIqCeMeGRuP1tIYt16REytHXSFxufiGB9corIurzQZ2RCKKZ_DDNZk6FejPLjm5HBRvq3ngzjU3PBY2MwhWmMwbVuNJRwP6hEjDtaQz5wGqBhdCl3E4fDa17giPUoiyx1oh5ZZcwr7_km7HmIt61pb1VU0MaOQyDqWOraQxS-6-Z9BKV39RV5pO5eoxXvuBP82O6qv0oyqRD3IPz1AE828k2FeFGTwa99jR5hl748CUCNBAk080fMzLkEzy_g7pRGuOu7q2-jHKfl9CJRSJ6-vIERcv93576X1BVedppIgdIuYCafJnYABwb0lFyx9rvEFbwrNGKEUA"
$postParams ="grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=$jwt"
#$postParams = $postParams | ConvertTo-Json
Write-Host $postParams
$contenttype = "application/x-www-form-urlencoded"
$result = Invoke-RestMethod -Uri $url -Method POST -Body $postParams -contenttype $contenttype
Write-host  $result.access_token

