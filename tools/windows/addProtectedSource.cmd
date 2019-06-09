@echo off

title "Adding protected feed"

setLocal enableExtensions
setLocal enableDelayedExpansion

set priority=20
set name="vc3protected"
set feedURL="https://www.myget.org/F/vc3-choco-protected/auth/c1f6fbb4-259f-4b72-bdcf-7dfd14a47875/api/v2"

call choco source add --name=%name% --source=%feedURL% --priority=%priority%

endLocal
