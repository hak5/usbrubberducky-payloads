<# ============================ VIRTUAL MACHINE + DEBUGGING AND MONITORING DETECTION REPORT ===============================

SYNOPSIS
Uses various methods to determine if the machine is a VM or if debugging or system monitoring software is running.
Will generate a console readout and verbose text file

USAGE
1. Run the script to generate a report.
2. View more detailed logs in the generated text file.

#>

$Host.UI.RawUI.BackgroundColor = "Black"
Clear-Host
[Console]::SetWindowSize(75, 40)
[Console]::Title = "VM and Anti-Analysis Detection"

$log = "$env:temp\VMdetect.log"
$isVMHost = $false
$isVM = $false

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

Write-Host "VM and Anti-Analysis software Detection by @beigeworm" -ForegroundColor White -BackgroundColor Green 
"VM and Anti-Analysis software Detection by @beigeworm `n" | Out-File -FilePath $log

function Test-VMHostNetwork {
    Write-Host "=== Virtual Machine Host ===" -ForegroundColor Gray

    # Check VMWARE network adapter (HOST)
    Write-Host "VMware Network Adapters.. " -NoNewline
    $isVMwareHost = $false

    $networkAdapters = Get-WmiObject Win32_NetworkAdapter -Filter "AdapterTypeId=0"
    foreach ($adapter in $networkAdapters) {
        if ($adapter.ServiceName -match 'vmxnet') {
            $isVMwareHost = $true
            $script:isVMHost = $true
            "Detected VMware host network adapter: $adapter.ServiceName" | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($isVMwareHost) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # Check VIRTUALBOX network adapter (HOST)
    Write-Host "VirtualBox Network Adapters.. " -NoNewline
    $isVirtualBoxHost = $false

    $networkAdapters = Get-WmiObject Win32_NetworkAdapter -Filter "AdapterTypeId=0"
    foreach ($adapter in $networkAdapters) {
        if ($adapter.ServiceName -match 'VBoxNet') {
            $isVirtualBoxHost = $true
            $script:isVMHost = $true
            "Detected VirtualBox host network adapter: $adapter.ServiceName" | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($isVirtualBoxHost) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # VirtualBox host reg checks
    $isVirtualBoxHostreg = $false
    Write-Host "VirtualBox Host Registry Keys.. " -NoNewline
    $vboxhostChecks = @{
        "VBoxServices" = "HKLM:\SYSTEM\CurrentControlSet\Services\VBox*";
        "VBoxDrivers" = "C:\WINDOWS\system32\drivers\VBox*";
    }

    foreach ($check in $vboxhostChecks.GetEnumerator()) {
        if (Test-Path $check.Value) {
            $isVirtualBoxHostreg = $true
            $script:isVMHost = $true
            "Detected VirtualBox host indicator: $($check.Key)" | Out-File -FilePath $log -Append

            $vboxChecks = @{
                "VBoxDSDT" = "HKLM:\HARDWARE\ACPI\DSDT\VBOX__";
                "VBoxFADT" = "HKLM:\HARDWARE\ACPI\FADT\VBOX__";
                "VBoxRSDT" = "HKLM:\HARDWARE\ACPI\RSDT\VBOX__";
            }
            foreach ($check in $vboxChecks.GetEnumerator()) {
                if (Test-Path $check.Value) {$script:isVMHost = $false;$isVirtualBoxHostreg = $false}
            }
        }
    }

    if ($isVirtualBoxHostreg) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }


    # Additional MAC address checks
    Write-Host "VMware Host MAC addresses.. " -NoNewline

    $networkAdapters = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.MACAddress -ne $null }
    foreach ($adapter in $networkAdapters) {
        $macAddress = $adapter.MACAddress -replace ":", ""
        if ($macAddress.StartsWith("005056")) {
            $isVMwaremachost = $true
            $script:isVMHost = $true
            "Detected VMware Host MAC address: $($adapter.MACAddress)" | Out-File -FilePath $log -Append
        }
    }

    if ($isVMwaremachost) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

}

function Test-VirtualMachine {

    $VMservicename = $false
    $VMmanufact = $false
    $VMModelname = $false
    $VMbiosname = $false

    Write-Host "`n=== Virtual Machine ===" -ForegroundColor Gray

    # VMware registry checks
    Write-Host "--- Registry Keys ---" -ForegroundColor Gray
    $isVMwarebox = $false
    Write-Host "VMware Registry Keys.. " -NoNewline
    $vmwareChecks = @{
        "VMwareTools" = "HKLM:\SOFTWARE\VMware, Inc.\VMware Tools";
        "VMwareMouseDriver" = "C:\WINDOWS\system32\drivers\vmmouse.sys";
        "VMwareSharedFoldersDriver" = "C:\WINDOWS\system32\drivers\vmhgfs.sys";
    }

    foreach ($check in $vmwareChecks.GetEnumerator()) {
        if (Test-Path $check.Value) {
            $isVMwarebox = $true
            $script:isVM = $true
            "Detected VMware indicator: $($check.Key)" | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($isVMwarebox) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # VirtualBox registry checks
    $isVirtualBoxreg = $false
    Write-Host "VirtualBox Registry Keys.. " -NoNewline
    $vboxChecks = @{
        "SystemBiosVersion" = "HKLM:\HARDWARE\Description\System\SystemBiosVersion";
        "VBoxGuestAdditions" = "HKLM:\SOFTWARE\Oracle\VirtualBox Guest Additions";
        "VideoBiosVersion" = "HKLM:\HARDWARE\Description\System\VideoBiosVersion";
        "VBoxDSDT" = "HKLM:\HARDWARE\ACPI\DSDT\VBOX__";
        "VBoxFADT" = "HKLM:\HARDWARE\ACPI\FADT\VBOX__";
        "VBoxRSDT" = "HKLM:\HARDWARE\ACPI\RSDT\VBOX__";
        "SystemBiosDate" = "HKLM:\HARDWARE\Description\System\SystemBiosDate";
    }

    foreach ($check in $vboxChecks.GetEnumerator()) {
        if (Test-Path $check.Value) {
            $isVirtualBoxreg = $true
            $script:isVM = $true
            $script:isVMHost = $false
            "Detected VirtualBox indicator: $($check.Key)"  | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($isVirtualBoxreg) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # Additional MAC address checks
    Write-Host "Network MAC addresses.. " -NoNewline

    $networkAdapters = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.MACAddress -ne $null }
    foreach ($adapter in $networkAdapters) {
        $macAddress = $adapter.MACAddress -replace ":", ""
        if ($macAddress.StartsWith("080027")) {
            $isVirtualBoxmac = $true
            "Detected VirtualBox MAC address: $($adapter.MACAddress)" | Out-File -FilePath $log -Append
        } elseif ($macAddress.StartsWith("000569") -or $macAddress.StartsWith("000C29") -or $macAddress.StartsWith("001C14")) {
            $isVMwaremac = $true
            "Detected VMware MAC address: $($adapter.MACAddress)" | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($isVirtualBoxmac -or $isVMwaremac) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }


    Write-Host "`n--- Virtual Machine Environment ---" -ForegroundColor Gray

    # Check common VM services
    Write-Host "Virtual Machine Services.. " -NoNewline
    $services = Get-Service
    $vmServices = @('vmtools', 'vmmouse', 'vmhgfs', 'vmci', 'VBoxService', 'VBoxSF')
    foreach ($service in $vmServices) {
        if ($services -match $service) {
            $VMservicename = $true
            $script:isVM = $true
            "Detected VM service: $service"  | Out-File -FilePath $log -Append
        }
    }

    Sleep -m 200
    if ($VMservicename) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }


    # Check hardware
    Write-Host "Virtual Machine Manufacturers.. " -NoNewline
    $manufacturer = (Get-WmiObject Win32_ComputerSystem).Manufacturer
    $vmManufacturers = @('Microsoft Corporation', 'VMware, Inc.', 'Xen', 'innotek GmbH', 'QEMU')

    if ($vmManufacturers -contains $manufacturer) {
        $VMmanufact = $true
        $script:isVM = $true
        "Detected VM manufacturer: $manufacturer" | Out-File -FilePath $log -Append
    }

    Sleep -m 200
    if ($VMmanufact) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # Check models
    Write-Host "Virtual Machine Models.. " -NoNewline
    $model = (Get-WmiObject Win32_ComputerSystem).Model
    $vmModels = @('Virtual Machine', 'VirtualBox', 'KVM', 'Bochs')

    if ($vmModels -contains $model) {
        $VMModelname = $true
        $script:isVM = $true
        "Detected VM model: $model" | Out-File -FilePath $log -Append
    }

    Sleep -m 200
    if ($VMModelname) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # Check bios
    Write-Host "Virtual Machine Bios.. " -NoNewline
    $bios = (Get-WmiObject Win32_BIOS).Manufacturer
    $vmBios = @('Phoenix Technologies LTD', 'innotek GmbH', 'Xen', 'SeaBIOS')

    if ($vmBios -contains $bios) {
        $VMbiosname = $true
        $script:isVM = $true
        "Detected VM BIOS: $bios" | Out-File -FilePath $log -Append
    }

    Sleep -m 200
    if ($VMbiosname) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }


}

function Test-Screensize {

    Write-Host "Current Screen Size.. " -NoNewline
    Add-Type -AssemblyName System.Windows.Forms
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $Width = $screen.Bounds.Width
    $Height = $screen.Bounds.Height
    
    "Screen Size: $Width x $Height" | Out-File -FilePath $log -Append

    # List of common screen resolutions
    $commonResolutions = @(
        "1280x720",
        "1280x800",
        "1280x1024",
        "1366x768",
        "1440x900",
        "1600x900",
        "1680x1050",
        "1920x1080",
        "1920x1200",
        "2560x1440",
        "3840x2160"
    )

    # Current resolution as a string
    $currentResolution = "$Width`x$Height"

    if ($commonResolutions -contains $currentResolution) {
        Write-Host "OK" -ForegroundColor Green
    } else {
        $script:isVM = $true
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }

}

function Test-Debugger {

    # check if a debugger is present
    Write-Host "`n=== Debugging + Monitoring ===" -ForegroundColor Gray
    Write-Host "Debugging Software.. " -NoNewline
    Add-Type @"
        using System;
        using System.Runtime.InteropServices;

        public class DebuggerCheck {
            [DllImport("kernel32.dll")]
            public static extern bool IsDebuggerPresent();

            [DllImport("kernel32.dll", SetLastError=true)]
            public static extern bool CheckRemoteDebuggerPresent(IntPtr hProcess, ref bool isDebuggerPresent);
        }
"@

    $isDebuggerPresent = [DebuggerCheck]::IsDebuggerPresent()
    $isRemoteDebuggerPresent = $false
    [DebuggerCheck]::CheckRemoteDebuggerPresent([System.Diagnostics.Process]::GetCurrentProcess().Handle, [ref]$isRemoteDebuggerPresent) | Out-Null

    if ($isDebuggerPresent -or $isRemoteDebuggerPresent) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
    }
    else {
        Write-Host "OK" -ForegroundColor Green
    }

    # check if a Monitoring is present
    Write-Host "Monitoring Software.. " -NoNewline
    $taskManagers = @(
        "taskmgr",       
        "procmon",
        "procmon64",     
        "procexp",
        "procexp64",     
        "perfmon",
        "perfmon64",      
        "resmon",
        "resmon64",        
        "ProcessHacker"   
    )
    $runningTaskManagers = @()
    foreach ($taskManager in $taskManagers) {
        if (Get-Process -Name $taskManager -ErrorAction SilentlyContinue) {
            $runningTaskManagers += $taskManager
        }
    }

    if ($runningTaskManagers.Count -gt 0) {
        Write-Host "Detected!" -ForegroundColor White -BackgroundColor Red
        $runningTaskManagers | ForEach-Object { "Monitoring software found: $_" | Out-File -FilePath $log -Append }
    } else {
        Write-Host "OK" -ForegroundColor Green
    }
}

function Verdict{
    Write-Host "`n=== Result ===" -ForegroundColor Gray 
    
    
    if ($isVMHost) {
        Write-Host "The environment appears to HOST virtual machines." -ForegroundColor Cyan
    } 
    else{
        if ($isVM) {
            Write-Host "The environment appears to be a VIRTUAL MACHINE." -ForegroundColor Red
        } 
        else {
            Write-Host "The environment does NOT appear to be a virtual machine." -ForegroundColor Green
        }
    }
    
}

function Test-Hardware{

    Write-Host "`n=== System Hardware + Input ===" -ForegroundColor Gray

    # Check operating system uptime
    Write-Host "Operating System Uptime.. " -NoNewline
    $lastBootUpTime = (Get-WmiObject Win32_OperatingSystem).LastBootUpTime
    $uptime = (Get-Date) - ([System.Management.ManagementDateTimeConverter]::ToDateTime($lastBootUpTime))
    $uptimeCheck = $uptime.TotalHours -gt 1
    $uptimeHours = [math]::Floor($uptime.TotalHours)

    if ($uptimeCheck) {
        Write-Host "$uptimeHours Hrs" -ForegroundColor Green
        "Operating System Uptime: $uptimeHours Hrs" | Out-File -FilePath $log -Append
    } else {
        Write-Host "$uptimeHours Hrs" -ForegroundColor White -BackgroundColor Red
        "Operating System Uptime: $uptimeHours Hrs" | Out-File -FilePath $log -Append
    }
    
    # Check if disk size is <= 60GB using WMI
    Write-Host "Hard Disk Size.. " -NoNewline
    $diskSize = (Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'").Size / 1GB
    $roundedDiskSize = [math]::Floor($diskSize)
    $diskSizeCheck = $diskSize -gt 64

    if ($diskSizeCheck) {
        Write-Host "$roundedDiskSize GB" -ForegroundColor Green
        "HDD Size: $roundedDiskSize GB" | Out-File -FilePath $log -Append
    } else {
        Write-Host "$roundedDiskSize GB" -ForegroundColor White -BackgroundColor Red
        "HDD Size: $roundedDiskSize GB" | Out-File -FilePath $log -Append
    }

    # Check physical memory size
    Write-Host "Total Physical Memory.. " -NoNewline
    $memory = (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory / 1GB
    $roundedMemory = [math]::Floor($memory)
    $memoryCheck = $memory -gt 1
    
    if ($memoryCheck) {
        Write-Host "$roundedMemory GB" -ForegroundColor Green
        "Total Physical Memory: $roundedMemory GB" | Out-File -FilePath $log -Append
    } else {
        Write-Host "$roundedMemory GB" -ForegroundColor White -BackgroundColor Red
        "Total Physical Memory: $roundedMemory GB" | Out-File -FilePath $log -Append
    }

    # Check core count
    Write-Host "CPU Core Count.. " -NoNewline
    $coreCount = (Get-WmiObject Win32_Processor).NumberOfCores
    $coreCheck = $coreCount -gt 2

    if ($coreCheck) {
        Write-Host "$coreCount" -ForegroundColor Green
        "Number Of Cores: $coreCount" | Out-File -FilePath $log -Append
    } else {
        Write-Host "$coreCount" -ForegroundColor White -BackgroundColor Red
        "Number Of Cores: $coreCount" | Out-File -FilePath $log -Append
    }

    # Check if mouse is present
    Write-Host "Mouse Presence.. " -NoNewline
    $mousePresent = [System.Windows.Forms.SystemInformation]::MousePresent
    
    if ($mousePresent) {
        Write-Host "OK" -ForegroundColor Green
        "Mouse Input Detected" | Out-File -FilePath $log -Append
    } else {
        Write-Host "Not Detected!" -ForegroundColor White -BackgroundColor Red
        "Mouse Input Not Detected!" | Out-File -FilePath $log -Append
    }
    
    # Check if Wscript is allowed
    try{
        Write-Host "Wscript + Dialog Boxes.. " -NoNewline
        $testbox = (New-Object -ComObject Wscript.Shell).Popup("Confirm You Are Not A Robot",3,"Captcha",0x0)
        if ($testbox -eq 1){
            Write-Host "OK" -ForegroundColor Green -NoNewline
            Write-Host " (Clicked)" -ForegroundColor DarkGray
            "Dialog Box Clicked" | Out-File -FilePath $log -Append
        }
        else{
            Write-Host "OK" -ForegroundColor Yellow -NoNewline
            Write-Host " (Not Clicked)" -ForegroundColor DarkGray
            "Dialog Box Not Clicked!" | Out-File -FilePath $log -Append
        }
    }
    catch{
        Write-Host "Not Allowed!" -ForegroundColor White -BackgroundColor Red
        "Dialog Box Not Allowed!" | Out-File -FilePath $log -Append    
    }
}

# ------------  RUN ALL THE FUNCTIONS  -------------
Write-Host "`n"
Test-VMHostNetwork
Test-VirtualMachine
Test-Screensize
Verdict
Test-Debugger
Test-Hardware
# --------------------------------------------------

pause
