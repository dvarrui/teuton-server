#!/usr/bin/env ruby
require 'socket'

module TeutonClient
  def self.run(input)
    hostname, port = read_input(input)
    connect_to_server(hostname, port)
  end

  def self.read_input(input)
    param = {}
    input.each do |line|
      items = line.split(':')
      param[items[0].to_sym] = items[1].to_s
    end
    param[:hostname] = param[:hostname] || 'localhost'
    param[:port] = param[:port] || '6174'
    return param[:hostname], param[:port]
  end

  def self.connect_to_server(hostname='localhost', port='6174')
    puts "[INFO] Connecting to #{hostname}:#{port}"
    s = TCPSocket.open(hostname, port)
    while line = s.gets    # Read lines from the socket
      puts line.chop       # And print with platform line terminator
    end
    s.close                # Close the socket when done
  end
end
