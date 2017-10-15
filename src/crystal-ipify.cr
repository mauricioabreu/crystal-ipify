require "http/client"
require "./crystal-ipify/*"

class UnavailableService < Exception
end

module Ipify
  extend self

  def get_ip
    response = HTTP::Client.get "https://api.ipify.org"

    if response.status_code != 200
      raise UnavailableService.new("Your request failed because ipify seems down. Response status code was #{response.status_code}")
    end

    response.body
  end
end
