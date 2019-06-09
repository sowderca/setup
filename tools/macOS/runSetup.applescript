use AppleScript
use scripting additions
use framework "Foundation"
use application "Finder"

property RUBY_INSTALLED            : boolean
property HOMEBREW_INSTALLED        : boolean
property HTTP_HEADER               : missing value
property HTTP_RESPONSE             : missing value
property HOMEBREW_INSTALL_SCRIPT   : "https://raw.githubusercontent.com/Homebrew/install/master/install"


property |NSURL|                   : a reference to current application's |NSURL|
property NSString                  : a reference to current application's NSString
property NSURLSession              : a reference to current application's NSURLSession
property NSJSONSerialization       : a reference to current application's NSJSONSerialization
property NSMutableURLRequest       : a reference to current application's NSMutableURLRequest
property NSUTF8StringEncoding      : a reference to current application's NSUTF8StringEncoding
property NSURLSessionConfiguration : a reference to current application's NSURLSessionConfiguration


on fetch(urlAddress as string)
  set HTTP_RESPONSE to missing value
  set address to |NSURL|'s URLWithString:urlAddress
  set request to NSMutableURLRequest's requestWithURL:address
  request's setHTTPMethod:"GET"
  set config to NSURLSessionConfiguration's defaultSessionConfiguration()
  set session to NSURLSession's sessionWithConfiguration:config delegate:(me) delegateQueue:(missing value)
  set task to session's dataTaskWithRequest:request

  set success to false as boolean

  task's resume()

  repeat (1000 * 10) times
    if HTTP_RESPONSE is not equal to missing value then
      set success to true
      exit repeat
    end if
    delay ("0.001" as real)
  end repeat

  if success = false then error "HTTP timeout error"

  return HTTP_RESPONSE
end fetch

on URLSession:tmpSession dataTask:tmpTask didReceiveData:tmpData
  set response to tmpTask's response()
  set responseBody to NSString's alloc()'s initWithData:tmpData encoding:(NSUTF8StringEncoding)
  set HTTP_RESPONSE to responseBody as string
end URLSession:dataTask:didReceiveData:


on isRubyInstalled()
  set installed to false as boolean
  try
    tell application "Finder" to set rbenv to exists (POSIX file "/Users/sowderca/.rbenv/shims/ruby") as alias
    if rbenv then set installed to true
    tell application "Finder" to set ruby to exists (POSIX file "/usr/bin/ruby") as alias
    if ruby then set installed to true
  on error
    set installed to false
  end try
end isRubyInstalled


on isHomebrewInstalled()
  set installed to false as boolean
  try
    set brew to (POSIX file "/usr/local/bin/brew") as alias
    tell application "Finder" to set installed to exists brew
  on error
    set installed to false
  end try
end isHomebrewInstalled

on installHomebrew()
  try
    set installScript to quoted form of fetch(HOMEBREW_INSTALL_SCRIPT)
    do shell script installScript
  on error
    error "Failed to install Homebrew"
    open location "https://brew.sh"
  end try
end installHomebrew()

on installRuby()
  error "macOS will soon remove builtin ruby. This will be implemented then"
end installRuby()


on run
  set HOMEBREW_INSTALLED to isHomebrewInstalled() as boolean
  set RUBY_INSTALLED to isRubyInstalled() as boolean
  if RUBY_INSTALLED is equal to false then installRuby()
  if HOMEBREW_INSTALLED is equal to true then installHomebrew()
  do shell script "brew install mas"
  do shell script "brew cask install powershell"
end run
