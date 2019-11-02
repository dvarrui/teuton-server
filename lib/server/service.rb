require 'socket'

class Service
  def run(param)
    service = TCPServer.open(param[:port])
    show_service(service)
    accept_clients service, param
  end

  private

  def accept_clients(server, param)
    begin
      loop {
        client = server.accept
        file = File.join(param[:pwd], 'projects', 'gnulinux-basic', '01')
        message = run_local_action("teuton play #{file}")
        respond_to_client client, message
      }
    rescue SystemExit, Interrupt
      puts "\n[ teuton-server ] Closing server..."
      exit 0
    end
  end

  def show_service(server)
    puts "[ teuton-service ] Running... (CTRL+C to exit)"
    puts "                  #{server.addr}"
  end

  def run_local_action(action)
    ok = system(action)
    status = (ok ? ' Done' : 'FAIL!')
    "#{status} <== #{action} "
  end

  def respond_to_client(client, message)
    puts "[#{timestamp}] #{message}"
    show_client client
    client.puts("        #{message}")
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

end
