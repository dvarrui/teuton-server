require 'socket'

class Service
  def run(param)
    service = TCPServer.open(param[:server][:port])
    accept_clients service, param
  end

  private

  def accept_clients(service, param)
    puts Rainbow("teuton-server => service [#{param[:client][:id]}] " +
         "listening on \'#{param[:server][:port]}\'...").bright
    #puts "                 #{service.addr}"
    @actions = []
    loop {
      client = service.accept

      action = run_local_action(param)
      respond_to_client client, param, action
      @actions << action
    }
  end

  def run_local_action(param)
    file = File.join(param[:server][:configdir], '01')
    report = File.join('var', param[:server][:testunits][0], 'case-01.txt')
    puts report
    command = "teuton play --quiet #{file}"

    ok = system(command)
    action = {}
    action[:timestamp] = Time.now
    action[:cmd] = command
    action[:status] = (ok ? 'Ok' : 'FAIL! ')
    action
  end

  def respond_to_client(client, param, action)
    #puts "                 ADDR        : #{client.addr}"
    #puts "                 PEERADDR    : #{client.peeraddr}"
    puts Rainbow("teuton-server => working...   " +
         "service[#{param[:client][:id]}]").bright
    src = "#{param[:server][:ip]}:#{param[:server][:port]}"
    dest = "#{param[:client][:ip]}:#{client.peeraddr[1]}"
    tab = '                 '

    output = tab + "Members    : #{param[:client][:members]}\n" +
             tab + "Connection : #{src} -> #{dest}\n" +
             tab + "Timestamp  : #{action[:timestamp]}\n" +
             tab + "Action     : #{action[:cmd]}\n" +
             tab + "Status     : #{action[:status]}\n"
    puts output
    client.puts("Connection : #{src} -> #{dest} ")
    client.puts("Timestamp  : #{action[:timestamp]}")
    client.puts("Action     : #{action[:cmd]}")
    client.puts("Status     : #{action[:status]}")
    client.close
  end
end
