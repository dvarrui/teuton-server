require 'socket'
require_relative 'client/input_loader'

module TeutonClient
  def self.run(args)
    show_help unless args.size == 1
    hostname, port = InputLoader.read_input(args[0])
    connect_to_server(hostname, port)
  end

  def self.connect_to_server(hostname='localhost', port='6174')
    puts "teuton-client => Connecting to #{hostname}:#{port}"
    begin
      s = TCPSocket.open(hostname, port)
    rescue
      puts "teuton-client => ERROR: Server #{hostname}:#{port} not found!"
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
