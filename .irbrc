require 'pp'
require 'irb/completion'
require 'what_methods'
require 'wirble'
IRB.conf[:AUTO_INDENT] = true
Wirble.init
Wirble.colorize
