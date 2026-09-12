# PowerShell System Information Tool

A Windows PowerShell script that gathers computer details useful for basic IT troubleshooting. Rebuilt from a system administration coursework exercise.

## Information Displayed

- Windows version and operating system architecture
- Processor model, physical cores, and logical processors
- Computer name and RAM reported by Windows
- C: drive total size and free space
- BIOS manufacturer, version, and release date
- Configured Windows time zone

## Requirements

- Windows with Windows PowerShell 5.1
- No additional packages required

Tested on Windows 11 Home using Windows PowerShell.

## How to Run

Download `system_info.ps1` and open PowerShell in the folder containing it.

Run:

```powershell
.\system_info.ps1
```

If your personal computer blocks scripts because of its execution policy, you can allow locally written scripts for the current PowerShell session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
```

Then run the script again. The policy change ends when that PowerShell session closes. Organization-managed policies may prevent this change.

## Skills Practiced

- Retrieving system information with Get-CimInstance
- Selecting properties and using pipelines
- Storing information in variables
- Creating custom objects
- Converting and rounding memory and storage values
- Formatting console output

## Notes

The script reads information without changing system settings.
It displays results in the console and does not save a report.

Storage information is limited to the C: drive.
Fields labeled GB use PowerShell's binary 1GB unit
(1,073,741,824 bytes, technically GiB).
