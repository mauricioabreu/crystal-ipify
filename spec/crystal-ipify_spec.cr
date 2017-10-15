require "io"
require "webmock"
require "./spec_helper"

WebMock.allow_net_connect = true

describe Ipify do
  it "returns a valid IP" do
    is_valid_ip(Ipify.get_ip).should be_true
  end

  it "raises exception when service is down" do
    WebMock.stub(:get, "https://api.ipify.org")
           .to_return(status: 500)
    expect_raises(UnavailableService) do
      Ipify.get_ip
    end
  end
end
