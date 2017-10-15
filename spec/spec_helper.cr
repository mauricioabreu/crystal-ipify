require "socket"
require "spec"
require "../src/crystal-ipify"

def is_valid_ip(ip : String)
  Socket.ip? ip
end
