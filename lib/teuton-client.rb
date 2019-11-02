#!/usr/bin/env ruby
require 'socket'

module TeutonClient
  def self.run(args)
    show_help unless args.size == 1
    hostname, port = read_input(args[0])
    connect_to_server(hostname, port)
  end

  def self.read_input(input)
    items = input.split(':')
    ip = (items[0].size > 0 ? items[0] : 'localhost')
    port = (items[1].size > 0 ? items[1].to_i : 9000 )
    return ip, port
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
    puts "    teuton-client [help|version] [IP:port]"
    puts "Params:"
    puts "    help    , show this help"
    puts "    version , show current version"
    puts "    IP      , Teuton server IP"
    puts "    port    , Teuton server port number"
    exit 0
  end

  def self.show_version
    puts "teuton-client (version 0.0.1)"
    exit 0
  end
end
