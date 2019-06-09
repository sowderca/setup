#!/usr/bin/env pwsh
#Requires -Version 5


function Register-Windows {
    [CmdletBinding()]
    [OutputType([void])]
    param();
    [CimInstance] $softwareLicensingService = Get-CimInstance -QueryDialect 'WQL' -Query 'select * from SoftwareLicensingService' -Namespace 'root/cimv2';
    if ($null -ne $softwareLicensingService.OA3xOriginalProductKey)
}
