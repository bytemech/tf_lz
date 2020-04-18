foreach ($item in $(
    Gci -Recurse 
)) {
    if (
        ($(gci -Path $item.fullname) -match "tfstate") -or `
        $(($item.name -match ".terraform") -and ($item.psiscontainer -eq $true))
    ){
        Remove-Item $item.fullname -Recurse -Force | Out-Null
    }
}