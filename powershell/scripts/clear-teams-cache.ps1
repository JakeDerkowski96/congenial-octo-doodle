Get-ChildItem -Path "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Teams" -Directory|Where{$_ -in ('Cache','databases','blob_storage','IndexedDB','')}|ForEach{Remove-Item $_.FullName -Recurse -Force}