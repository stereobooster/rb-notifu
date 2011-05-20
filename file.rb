#require 'pathname'
#require Pathname.new('lib/rb-notifu').realpath.to_s

require 'rb-notifu'

RbNotifu::show({
  :message => "test",
  :type => :warn
})