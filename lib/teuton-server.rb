require 'socket'                 # Get sockets from stdlib

class TeutonServer
  def run(port = 6174, state = '/tmp/.running')
    puts "[teuton-server] Running..."
    system("touch #{state}")
    server = TCPServer.open(port)    # Socket to listen on port
    loop {
      exit unless File.exists? state
      client = server.accept        # Wait for a client to connect
      msg = "teuton play 01 => grade  0%"
      puts "[#{Time.now}] #{msg}"
      show_client client
      client.puts("[teuton-server] #{msg}")
      client.close
    }
  end

  def show_client(client)
    #puts client.gethostbyname
    puts " * ADDR     : #{client.addr}"
    puts " * PEERADDR : #{client.peeraddr}"
  end
end
