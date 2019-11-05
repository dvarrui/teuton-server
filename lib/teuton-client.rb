require 'socket'
require 'rainbow'
require_relative 'client/input_loader'

module TeutonClient
  def self.run(args)
    hostname, port = InputLoader.read_input(args)
    connect_to_server(hostname, port)
    exit 0
  end

  def self.connect_to_server(hostname='localhost', port='6174')
    puts Rainbow("teuton-client => Waiting...   " +
                 "#{hostname}:#{port} (teuton-server)").bright
    begin
      s = TCPSocket.open(hostname, port)
    rescue
      puts Rainbow("teuton-client => " +
                   "ERROR        teuton-server not found!" +
                   " [#{hostname}:#{port}]").bright.red
      exit 1
    end
    while line = s.gets    # Read lines from the socket
      puts "              => #{line.chop}"
    end
    s.close                # Close the socket when done
  end

  def self.show_help
    puts "Usage:"
    puts "    teuton-client [help|version] [IP [PORT]]"
    puts "Params:"
    puts "    help    , show this help"
    puts "    version , show current version"
    puts "    IP PORT , Teuton server IP and/or PORT"
    exit 0
  end

  def self.show_version
    puts "teuton-client (version 0.0.1)"
    exit 0
  end
end
