$nums = 1, 2, 3, 4, 6, 8, 9, 10, 16, 17, 18, 20

foreach ($i in $nums) {
    $fileName = 'prob' + $i + '.tex'
    $newPath= Join-Path -path 'hw1/sections/' -childpath $fileName
    New-Item $newPath -type file
}