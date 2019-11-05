
module InputLoader
  def self.read_input(args)
    ip = (args[0] ? args[0] : 'localhost')
    port = (args[1] ? args[1] : 16000)
    return ip, port
  end
end
