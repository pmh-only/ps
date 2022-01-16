if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Write-Output "not elevated, try 'iwr pmh.codes/ps/admin | iex'"
} else {
  Set-MpPreference -DisableRealtimeMonitoring $true
  New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force
  Write-Output "Windows Defender has been Disabled"
}