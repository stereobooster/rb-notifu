require 'pathname'
module RbNotifu

  @executable = Pathname.new(__FILE__).parent.parent.realpath.to_s + '/bin/notifu.exe'
  
  @option_to_flag = {
    :type => "t",
    :display => "d",
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
    :display => 3000,
    :title => "rb-notifu",
    :message => " ",
    :icon => false,
    :baloon => false,
    :nosound => false,
    :noquiet => false,
    :xp => false
  }

  #Params:
  #  :type     The type of message to display values are:
  #              info   The message is an informational message
  #              warn   The message is an warning message
  #              error  The message is an error message
  #  :display  The number of milliseconds to display (omit or 0 for infinit)
  #  :title    The title (or prompt) of the ballon
  #  :message  The message text
  #  :icon     Specify an icon to use ("parent" uses the icon of the parent process)
  #  :baloon   Enable ballon tips in the registry (for this user only)
  #  :nosound  Do not play a sound when the tooltip is displayed
  #  :noquiet  Show the tooltip even if the user is in the quiet period that follows his very first login (Windows 7 and up)
  #  :xp       Use IUserNotification interface event when IUserNotification2 is available
  #
  #Returns
  #  0 Registry was succesfully edited. Only returned when /e is used with no other argument.
  #  1 There was an error in one the argument or some required argument was missing.
  #  2 The balloon timed out waiting. The user didn't click the close button or the balloon itself.
  #  3 The user clicked the balloon.
  #  4 The user closed the balloon using the X in the top right corner.
  #  5 IUserNotification class object or interface is not supported on this version of Windows.
  #  6 The user clicked with the right mouse button on the icon, in the system notification area (Vista and later)
  #  7 The user clicked with the left mouse button on the icon, in the system notification area (Vista and later)
  #  8 A new instance of Notifu dismissed a running instace
  #  255 There was some unexpected error.
  def self.show(options = {})
    flags = ""
    @option_default.each do |key, value|
      flag = options.key?(key) ? options[key] : value
      if flag
        flags += "/" + @option_to_flag[key] + " " + self.escape(flag) + " "
      end
    end
    system "#{@executable} #{flags}"
    return $?.exitstatus
  end

  def self.escape(value)
    if value
      return '"' + value.to_s.gsub('"','\"') + '"'
    else
      return ''
    end
  end

end
