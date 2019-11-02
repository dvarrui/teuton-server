
module InputLoader
  def self.read_input_args(input)
    param = {}
    input.each do |line|
      items = line.split(':')
      param[items[0].to_sym] = items[1].to_s
    end
    param[:hostname] = param[:hostname] || 'localhost'
    param[:port] = param[:port] || '6174'
    param[:pwd] = Dir.pwd
    return param
  end
end
