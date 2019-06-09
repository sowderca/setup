#!/usr/bin/env pwsh
#Requires -Version 6

using namespace System;

Set-StrictMode -Version 'Latest';

function Write-SystemSetupInformation {
    [CmdletBinding()]
    [OutputType([void])]
    param();
    # Platform metadata
    Write-Information -MessageData @"
    `e[90m
        ⚡ Running $($PSVersionTable.PSEdition) v$($PSVersionTable.PSVersion) on $($PSVersionTable.Platform) ⚡
            OS: $($PSVersionTable.OS)
            PWD: $($PWD.Path.Replace('C:', '').Replace('\', '/'))
    `e[0m
"@ -Tags @('Metadata') -InformationAction 'Continue';
}
