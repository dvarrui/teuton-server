require 'yaml'

module InputLoader
  def self.read_input_args(input)
    param = {}
    param = read_yaml(input[0])
    param[:server][:ip] = input[1] if input[1]
    param[:server][:ip] = '127.0.0.1' if param[:server][:ip].nil?
    param[:server][:port] = input[2] if input[2]
    param[:server][:port] = 16000 if param[:server][:port].nil?
    param
  end

  def self.read_yaml(filepath)
    filepath = File.join(filepath, 'server.yaml') if File.directory? filepath
    unless File.exists? filepath
      puts Rainbow("[ERROR] Config file  \'#{filepath}\' not found!").red
      exit 1
    end
    param = YAML.load_file(filepath)
    param[:server][:configfile] = filepath
    param[:server][:configdir] = File.dirname(filepath)
    param
  end
end
