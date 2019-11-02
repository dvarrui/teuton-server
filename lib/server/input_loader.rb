require 'yaml'

module InputLoader
  def self.read_input_args(input)
    param = {}
    param = read_yaml(input[0])
    param[:pwd] = Dir.pwd
    return param
  end

  def self.read_yaml(filename)
    param = YAML.load_file(filename)
    param[:hostname] = param[:server][:ip]
    param[:port] = param[:server][:port]
    param
  end

  def self.read_string(input)
    input.each do |line|
      items = line.split(':')
      param[items[0].to_sym] = items[1].to_s
    end
    param[:hostname] = param[:hostname] || 'localhost'
    param[:port] = param[:port] || '6174'
    return param
  end
end
