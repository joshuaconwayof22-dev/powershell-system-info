# Display operating system information
Write-Host "`nOperating System"
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, OSArchitecture |
    Format-List

# Display processor information
Write-Host "`nProcessor"
Get-CimInstance Win32_Processor |
    Select-Object Name, NumberOfCores, NumberOfLogicalProcessors |
    Format-List

# Display computer name and installed memory
Write-Host "`nComputer and Memory"
$computer = Get-CimInstance Win32_ComputerSystem

[PSCustomObject]@{
    ComputerName = $computer.Name
    RAM_GB = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
} | Format-List

# Display C: drive storage information
Write-Host "`nC: Drive Storage"
$drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

[PSCustomObject]@{
    Drive = $drive.DeviceID
    TotalSize_GB = [math]::Round($drive.Size / 1GB, 2)
    FreeSpace_GB = [math]::Round($drive.FreeSpace / 1GB, 2)
} | Format-List


# Display BIOS information
Write-Host "`nBIOS"
Get-CimInstance Win32_BIOS |
    Select-Object Manufacturer, SMBIOSBIOSVersion, ReleaseDate |
    Format-List

# Display the current time zone
Write-Host "`nTime Zone"
Get-TimeZone |
    Select-Object Id, DisplayName |
    Format-List
