require 'socket'

class Service
  def run(param)
    service = TCPServer.open(param[:server][:port])
    accept_clients service, param
  end

  private

  def accept_clients(service, param)
    puts Rainbow("teuton-server => service [#{param[:client][:id]}] " +
         "listening on #{param[:server][:port]}...").bright
    #puts "                 #{service.addr}"
    actions = []
    loop {
      client = service.accept
      file = File.join(param[:server][:configdir], '01')
      action = {}
      action[:cmd] = "teuton play --quiet #{file}"
      action[:status] = run_local_action(action[:cmd])
      action[:timestamp] = Time.now
      actions << action
      respond_to_client client, param, action
    }
  end

  def run_local_action(action)
    ok = system(action)
    return (ok ? 'Ok' : 'FAIL! ')
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
