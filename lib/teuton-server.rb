require 'socket'                 # Get sockets from stdlib

class TeutonServer
  def run(input)
    port = read_input(input)
    start_service(port)
  end

  def read_input(input)
    param = {}
    input.each do |line|
      items = line.split(':')
      param[items[0].to_sym] = items[1].to_s
    end
    param[:hostname] = param[:hostname] || 'localhost'
    param[:port] = param[:port] || '6174'
    return param[:port]
  end

  def start_service(port)
    server = TCPServer.open(port)    # Socket to listen on port
    accept_clients server
  end

  def accept_clients(server)
    show_server server
    begin
      loop {
        client = server.accept        # Wait for a client to connect
        respond_to_client client
      }
    rescue SystemExit, Interrupt
      puts "\n[ teuton-server ] Closing server..."
      exit 0
    end
  end

  def show_server(server)
    puts "[ teuton-server ] Running... (CTRL+C to exit)"
    puts "                  #{server.addr}"
  end

  def respond_to_client(client)
    msg = "teuton play 01 => grade 0%"
    puts "[#{timestamp}] #{msg}"
    show_client client
    client.puts("[ teuton-server ] #{msg}")
    client.close
  end

  def timestamp
    t = Time.now
    m = "#{t.year}#{format('%02d',t.month)}#{format('%02d',t.day)}-" +
        "#{format('%02d',t.hour)}#{format('%02d',t.min)}#{format('%02d',t.sec)}"
    m
  end

  def show_client(client)
    puts "   ├── ADDR     : #{client.addr}"
    puts "   └── PEERADDR : #{client.peeraddr}"
  end

  def self.show_help
    puts "Usage:"
    puts "    teuton-server [configfile|help|version]"
    puts "Params:"
    puts "    configfile, YAML server configuration file"
    puts "    help, show this help"
    puts "    version"
    exit 0
  end

  def self.show_version
    puts "teuton-server (version 0.0.1)"
    exit 0
  end
end
