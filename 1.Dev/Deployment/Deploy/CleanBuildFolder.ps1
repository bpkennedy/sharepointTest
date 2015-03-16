Write-Host "CleanUp Script Started"

$keepExtensions = ".wsp", ".ps1"

$keepFiles = "config.xml","sync-timestamps.xml"

Write-Host("EXTENSIONS KEPT: " + $keepExtensions)
Write-Host("FILES KEPT: " + $keepFiles)


$path = "..\bin"
  
$files = Get-ChildItem -Path $path | where {$_.Extension -ne $keepExtensions}
foreach($file in $files) 
{     
    if (
        (
            $keepExtensions -notcontains $file.Extension -and 
            $file.Extension.Length -ne 0
        ) -and
        (
            $keepFiles -notcontains $file.Name
        )
       )
    {
        write-host("Deleted: " + $file.Name)
        Remove-Item $file.FullName
    }
} 

Write-Host "CleanUp Script Completed"