$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = 'E:\Prueba\'
$watcher.EnableRaisingEvents = $true
$pattern = '2020'
$cont = 0
$action = {
     $path = $event.SourceEventArgs.FullPath 
     $name = $event.SourceEventArgs.Name 
     $timeStamp = $Event.TimeGenerated 
     if($name -match $pattern)
     {
         $new_name = "$($name)$($cont).MAN" 
         Write-Host "$name" 
         Rename-Item -Path $path -NewName $new_name
     }
     $changetype = $event.SourceEventArgs.ChangeType
     $cont+=1 
     Write-Host "$path was $cont at $(get-date)"
     } 
     Register-ObjectEvent $watcher 'Created' -Action $action 
     