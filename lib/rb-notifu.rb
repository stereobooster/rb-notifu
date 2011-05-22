require 'pathname'
module Notifu

  @executable = Pathname.new(__FILE__).parent.parent.realpath.to_s + '/bin/notifu.exe'
  
  @option_to_flag = {
    :type => "t",
    :time => "d",
    :title => "p",
    :message => "m",
    :icon => "i",
    :baloon => "e",
    :nosound => "q",
    :noquiet => "w",
    :xp => "xp"
  }
  
  @option_default = {
    :type => :info,
    :time => 3,
    :title => "rb-notifu",
    :message => " ",
    :icon => false,
    :baloon => false,
    :nosound => false,
    :noquiet => false,
    :xp => false
  }

  # There was an error in one the argument or some required argument was missing.
  ERROR_ARGUMENT = 1
  
  # IUserNotification class object or interface is not supported on this version of Windows.
  ERROR_NOT_SUPPORTED = 5
  
  # There was some unexpected error.
  ERROR_UNEXPECTED = 256
  
  ERRORS = [ERROR_ARGUMENT, ERROR_NOT_SUPPORTED, ERROR_UNEXPECTED]
  
  # Registry was succesfully edited. Only returned when /e is used with no other argument.
  SUCCESS_REGISTRY = 0
  
  # The balloon timed out waiting. The user didn't click the close button or the balloon itself.
  SUCCESS_TIMEOUT = 2
  
  # The user clicked the balloon.
  SUCCESS_CLICK = 3
  
  # The user closed the balloon using the X in the top right corner.
  SUCCESS_CLOSE = 4
  
  # The user clicked with the right mouse button on the icon, in the system notification area (Vista and later)
  SUCCESS_RIGHT = 6
  
  # The user clicked with the left mouse button on the icon, in the system notification area (Vista and later)
  SUCCESS_LEFT = 7
  
  # A new instance of Notifu dismissed a running instace
  SUCCESS_NEW_INSTANCE = 8
  
  #Params:
  #  :type     The type of message to display values are:
  #              info   The message is an informational message
  #              warn   The message is an warning message
  #              error  The message is an error message
  #  :time     The number of seconds to display (omit or 0 for infinit)
  #  :title    The title (or prompt) of the ballon
  #  :message  The message text
  #  :icon     Specify an icon to use ("parent" uses the icon of the parent process)
  #  :baloon   Enable ballon tips in the registry (for this user only)
  #  :nosound  Do not play a sound when the tooltip is displayed
  #  :noquiet  Show the tooltip even if the user is in the quiet period that follows his very first login (Windows 7 and up)
  #  :xp       Use IUserNotification interface event when IUserNotification2 is available
  def self.show(options = {}, &block)
    flags = ""
    @option_default.each do |key, value|
      flag = options.key?(key) ? options[key] : value
      if key == :time
        flag = (flag * 1000).to_i
      end
      if flag
        flags += "/" + @option_to_flag[key] + " "
        if flag != true
          flags += self.escape(flag) + " "
        end
      end
    end
    Thread.new{
      system "#{@executable} #{flags}"
      block.call($?.exitstatus)
    }
  end

  def self.escape(value)
    if value
      return '"' + value.to_s.gsub('"','\"') + '"'
    else
      return ''
    end
  end

end
