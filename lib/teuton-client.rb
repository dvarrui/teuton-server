#!/usr/bin/env ruby
require 'socket'

module TeutonClient
  def self.run(hostname = 'localhost', port = 6174)
    s = TCPSocket.open(hostname, port)
    while line = s.gets    # Read lines from the socket
      puts line.chop       # And print with platform line terminator
    end
    s.close                # Close the socket when done
  end
end
