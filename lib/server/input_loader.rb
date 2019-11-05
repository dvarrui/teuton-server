require 'yaml'

module InputLoader
  def self.read_input_args(input)
    param = {}
    param = read_yaml(input[0])
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
