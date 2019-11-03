require 'yaml'

module InputLoader
  def self.read_input_args(input)
    param = {}
    param = read_yaml(input[0])
    param[:pwd] = Dir.pwd
    return param
  end

  def self.read_yaml(filepath)
    filepath = File.join(filepath, 'server.yaml') if File.directory? filepath
    unless File.exists? filepath
      puts "[ERROR] Config file #{filepath} not found!"
      exit 1
    end
    param = YAML.load_file(filepath)
    param[:configfile] = filepath
    param[:hostname] = param[:server][:ip]
    param[:port] = param[:server][:port]
    param
  end
end
