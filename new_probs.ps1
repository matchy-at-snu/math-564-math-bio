$nums = 4, 8, 11, 16, 17

foreach ($i in $nums) {
    $fileName = 'prob' + $i + '.tex'
    $newPath= Join-Path -path 'sections/hw2/' -childpath $fileName
    New-Item $newPath -type file
}