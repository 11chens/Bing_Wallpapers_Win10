$ContainerPath = Join-Path $PSScriptRoot "Pictures"
$date = Get-Date -Format 'yyyy_MM_dd_'

if (!(Test-Path $ContainerPath -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $ContainerPath
}

# 设置 Bing 壁纸的 URL
$url = "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US"

# 获取 Bing 壁纸的 URL
$response = Invoke-WebRequest -Uri $url -UseBasicParsing
$imageUrl = "https://www.bing.com" + ($response.Content | ConvertFrom-Json).images.url


# 下载 Bing 壁纸
$imagePath = $ContainerPath + '\img' + $date + '.jpg'
Write-Host $imagePath
Invoke-WebRequest -Uri $imageUrl -UseBasicParsing -OutFile $imagePath


#设置壁纸
(Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern bool SystemParametersInfo (uint uiAction, uint uiParam, String pvParam, uint fWinIni);' -Name 'Params' -PassThru)::SystemParametersInfo(20, 0, $imagePath, 3)

# 保存JSON文件
# $imageInfo = $response.Content | ConvertFrom-Json
# $imageInfo | ConvertTo-Json | Out-File -FilePath "bing_image_info.json"