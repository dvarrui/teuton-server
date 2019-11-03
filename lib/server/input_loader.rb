require 'yaml'

module InputLoader
  def self.read_input_args(input)
    param = {}
    param = read_yaml(input[0])
    param[:pwd] = Dir.pwd
    return param
  end

  def self.read_yaml(filename)
    unless (File.exists?(filename) && !File.directory?(filename))
      puts "[ERROR] Config file #{filename} not found!"
      exit 1
    end
    param = YAML.load_file(filename)
    param[:hostname] = param[:server][:ip]
    param[:port] = param[:server][:port]
    param
  end
end
