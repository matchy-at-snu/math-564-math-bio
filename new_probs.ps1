$hw = Read-Host -Prompt 'Input hw number'
# Create empty array
$probs = @()
$temp = -1
while(1) {
    $temp = Read-Host -Prompt "Enter hw problem numbers (integer or comma/space separated array)`nType 'end' to quit"
    if($temp -eq "end") {
        break
    }
    $nums = $temp.split(", ")
    $probs = $probs + $nums
}

$hwPath = '.\hw'+$hw
$secPath = $hwPath + '\sections'
$figPath = $hwPath + '\fig'

New-Item -ItemType Directory -Force -Path $hwPath
New-Item -ItemType Directory -Force -Path $secPath
New-Item -ItemType Directory -Force -Path $figPath

foreach ($i in $probs) {
    $fileName = 'prob' + $i + '.tex'
    $newPath= Join-Path -path $secPath -childpath $fileName
    New-Item $newPath -Force -type file
}