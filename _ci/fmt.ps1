foreach ($dir in $(
    Gci -Recurse | Where-Object { $_.PSIsContainer -eq $True}
)) {
    if ($(gci -Path $dir.fullname).Extension -match ".tf") {
        Set-Location $dir.fullname
        terraform fmt 
    }
}
