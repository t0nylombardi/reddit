require "net/http"
require "uri"
require "json"
require 'socket'

uri = URI.parse("http://www.reddit.com/r/rails/new/.json")


class StreamClient
  def initialize user, pass
    @ba = ["#{user}:#{pass}"].pack('m').chomp
  end

  def listen
    socket = TCPSocket.new 'reddit.com', 80
    socket.write "GET /r/rails/new/.json HTTP/1.1\r\n"
    socket.write "Host: reddit.com\r\n"
    socket.write "\r\n"

    # Read the headers
    while((line = socket.readline) != "\r\n"); puts line if $DEBUG; end

    # Consume the feed
    while line = socket.readline
      puts line
    end
  end
end

StreamClient.new(ARGV[0], ARGV[1]).listen
