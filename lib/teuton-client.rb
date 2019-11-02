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
    puts "teuton-client ==> Connecting to #{hostname}:#{port}"
    begin
      s = TCPSocket.open(hostname, port)
    rescue
      puts "teuton-client ==> ERROR: Server #{hostname}:#{port} not found!"
      exit 1
    end
    while line = s.gets    # Read lines from the socket
      puts line.chop       # And print with platform line terminator
    end
    s.close                # Close the socket when done
  end

  def self.show_help
    puts "Usage:"
    puts "    teuton-client [help|version] [hostname:IP] [port:PORTNUMBER]"
    puts "Params:"
    puts "    help, show this help"
    puts "    version"
    puts "    hostname"
    puts "    port"
    exit 0
  end

  def self.show_version
    puts "teuton-client (version 0.0.1)"
    exit 0
  end
end
