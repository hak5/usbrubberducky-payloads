<#
    .AUTHOR
        TW-D

    .VERSION
        1.0

    .NOTES
        - This script requires administrative rights on the system to successfully install the module and execute the commands.
        - If the `NtObjectManager` module is already installed, it will be imported without being reinstalled.
        - Spawning a `cmd.exe` process with elevated privileges under its parent process `TrustedInstaller`.
#>

Param (
    [Parameter(Position = 0, Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Command
)

If (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    $MODULE_NAME = "NtObjectManager"
    $MODULE_VERSION = "1.1.32"

    # Check if the NtObjectManager module is installed
    $NtObjectManager = Get-InstalledModule -Name $MODULE_NAME -ErrorAction SilentlyContinue

    # If the module is not found, try to install it
    If ($NtObjectManager -eq $null) {
        Try {
            # Install the NtObjectManager module with a specific version
            Install-Module -Name $MODULE_NAME -RequiredVersion $MODULE_VERSION -Force
        } Catch {
            # If installation fails
            Write-Error "$_"
        }
    }

    # Attempt to import the NtObjectManager module
    Try {
        # Force import of the module to ensure it is loaded in the environment
        Import-Module NtObjectManager -Force
    } Catch {
        # If the import fails
        Write-Error "$_"
    }

    # Attempt to manage the TrustedInstaller service and launch a cmd.exe process with elevated privileges under its parent process
    Try {
        # Get the status of the TrustedInstaller service
        $TrustedInstaller = Get-Service -Name "TrustedInstaller" -ErrorAction SilentlyContinue

        # If the TrustedInstaller service exist, configure and stop it
        If ($TrustedInstaller) {
            C:\Windows\System32\sc.exe stop TrustedInstaller | Out-Null
        }

        # Configure the TrustedInstaller service by setting its binary path
        C:\Windows\System32\sc.exe config TrustedInstaller binPath= "C:\Windows\servicing\TrustedInstaller.exe" | Out-Null

        # Start the TrustedInstaller service
        C:\Windows\System32\sc.exe start TrustedInstaller | Out-Null

        # Get the TrustedInstaller process to use it as the parent process for cmd.exe
        $TrustedInstaller = Get-NtProcess "TrustedInstaller.exe" -ErrorAction Stop

        # Launch a new cmd.exe process with elevated privileges under TrustedInstaller,
        # by setting the TrustedInstaller process as the parent, the cmd.exe process inherits TrustedInstaller's privileges.
        New-Win32Process -CommandLine "C:\Windows\System32\cmd.exe /K ${Command}" -CreationFlags NewConsole -ParentProcess $TrustedInstaller | Out-Null
    } Catch {
        # If an error occurs at any stage
        Write-Error "$_"
    }

    #
    # Commented-out section to uninstall the NtObjectManager module after execution (if necessary)
    # Uninstall-Module -Name $MODULE_NAME -RequiredVersion $MODULE_VERSION -Force
    #
}
