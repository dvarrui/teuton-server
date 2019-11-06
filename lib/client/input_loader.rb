require 'yaml'

module InputLoader
  def self.read_input_args(input)
    if input.size.zero? && File.exists?('client.yaml')
      param = read_yaml('client.yaml')
      return param[:server][:ip], param[:server][:port]
    end
    ip = (input[0] ? input[0] : 'localhost')
    port = (input[1] ? input[1] : 16001)
    return ip, port
  end

  def self.read_yaml(filepath)
    unless File.exists? filepath
      puts "teuton-client => " +
           Rainbow("[ERROR] Config file  \'#{filepath}\' not found!").red
      exit 1
    end
    return YAML.load_file(filepath)
  end
end
