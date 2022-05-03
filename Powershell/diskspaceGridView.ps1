Get-WmiObject Win32_LogicalDisk -ComputerName "10.131.10.26" -Filter "DeviceID='C:'" |
    Select SystemName,DeviceID,VolumeName,
    @{
        Name="Size(GB)";Expression=
        {
            "{0:N1}" -f($_.size/1gb)
        }
    },
    @{
        Name="FreeSpace(GB)";Expression=
        {
            "{0:N1}" -f($_.freespace/1gb)
        }
    } |
    Out-GridView  cmd /c pause | out-null