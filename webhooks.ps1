$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $computername -Filter "DeviceID='C:'" |
        Select SystemName,DeviceID,VolumeName,FreeSpace
$content = $disk.VolumeName + " " + $disk.DeviceID + " " + $disk.SystemName +
           " " + $disk.FreeSpace/1024/1024/1024
$params = @{
     "@context"= "https://schema.org/extensions";
     "@type"= "MessageCard";
     "themeColor"= "0072C6";
     "title"= "Update excel remote report";
     "text"= $content.psobject.BaseObject;
     }
     $url = "webhookurl"
Invoke-WebRequest -Uri $url -Method POST -Body ($params|
     ConvertTo-Json) -ContentType "application/json"
