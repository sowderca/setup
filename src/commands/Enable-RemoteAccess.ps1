#!/usr/bin/env pwsh
#Requires -Version 6

using namespace System;

Set-StrictMode -Version 'Latest';


function Enable-RemoteAccess {
    [CmdletBinding()]
    [OutputType([void])]
    param();
    if ($IsWindows) {
        Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0
    }
}
