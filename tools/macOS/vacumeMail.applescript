#  Speed up Mail.app by vacuuming the Envelope Index
#  Code from: http://web.archive.org/web/20071008123746/http://www.hawkwings.net/2007/03/03/scripts-to-automate-the-mailapp-envelope-speed-trick/
#  Originally by "pmbuko" with modifications by Romulo
#  Updated by Brett Terpstra 2012
#  Updated by Mathias Tšrnblom 2015 to support V3 in El Capitan and still keep backwards compatibility
#  Updated by Andrei Miclaus 2017 to support V4 in Sierra
use AppleScript
use scripting additions
use framework "Foundation"

property OS_VERSION   : missing value as string
property MAIL_VERSION : missing value as string


on run
  tell application "Mail" to quit
  set OS_VERSION to do shell script "sw_vers -productVersion"
  set MAIL_VERSION to "V2"

  considering numeric strings
    if "10.10" <= os_version then set mail_version to "V3"
    if "10.12" <= os_version then set mail_version to "V4"
    if "10.13" <= os_version then set mail_version to "V5"
    if "10.14" <= os_version then set mail_version to "V6"
  end considering

  set sizeBefore to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"
  do shell script "/usr/bin/sqlite3 ~/Library/Mail/" & mail_version & "/MailData/Envelope\\ Index vacuum"

  set sizeAfter to do shell script "ls -lnah ~/Library/Mail/" & mail_version & "/MailData | grep -E 'Envelope Index$' | awk {'print $5'}"

  log("Mail index before: " & sizeBefore & return & "Mail index after: " & sizeAfter & return & return & "Enjoy the new speed!")

  tell application "Mail" to activate

end run
