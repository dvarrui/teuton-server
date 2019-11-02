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
end
