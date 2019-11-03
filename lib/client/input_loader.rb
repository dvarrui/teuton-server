
module InputLoader
  def self.read_input(input)
    items = ( input.split(':') == [] ? ['localhost', 16000] :input.split(':'))
    ip = (items[0].size == 0 ? 'localhost' : items[0])
    port = (items[1].nil? ? 16000 : items[1].to_i )
    return ip, port
  end
end 
