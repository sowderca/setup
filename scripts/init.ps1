#!/usr/bin/env pwsh
#Requires -Version 6

using namespace System;
using namespace System.Runtime.InteropServices;

[CmdletBinding()]
param();

Set-StrictMode -Version 'Latest';

Import-Module 'Microsoft.PowerShell.Utility';
Import-Module "$(Split-Path -Path $PSScriptRoot -Parent)/src/Setup.psd1";

if ([RuntimeInformation]::IsOSPlatform([OSPlatform]::OSX)) {
    # Setup macOS
    Write-Verbose -Message 'macOS';
} elseif ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Linux)) {
    # Setup Linux
    Write-Verbose -Message 'Linux';
} elseif ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Windows)) {
    # Setup Windows
    Write-Verbose -Message 'Windows';
} else {
    throw 'Unknown OS';
}
