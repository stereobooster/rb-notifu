# rb-notifu

> Notification Kung Fu for Windows.

Notification system for windows. Trying to be Growl. 
Ruby wrapper around notifu (http://www.paralint.com/projects/notifu/index.html)

There are three possible alternatives to Growl on windows:

 - Tray notification 
   - IUserNotification http://msdn.microsoft.com/en-us/library/bb774424(v=vs.85).aspx
   - Notifu http://www.paralint.com/projects/notifu/index.html
 - Growl for Windows http://www.growlforwindows.com/gfw/
 - Snarl http://www.fullphat.net/

## Example

```ruby
require 'rb-notifu'

Notifu::show :message => "test", :type => :warn do |status|
  p Notifu::ERRORS.include? status
end

sleep 1.5
```

## Available options

```
:type     The type of message to display values are:
            info   The message is an informational message
            warn   The message is an warning message
            error  The message is an error message
:time  The number of milliseconds to display (omit or 0 for infinit)
:title    The title (or prompt) of the ballon
:message  The message text
:icon     Specify an icon to use ("parent" uses the icon of the parent process)
:baloon   Enable ballon tips in the registry (for this user only)
:nosound  Do not play a sound when the tooltip is displayed
:noquiet  Show the tooltip even if the user is in the quiet period that follows his very first login (Windows 7 and up)
:xp       Use IUserNotification interface event when IUserNotification2 is available
```

## TODO

 - Use FFI instead of embedded executable file
