require 'fileutils'
require 'rainbow'
require_relative 'server/input_loader'
require_relative 'server/service_manager'

module TeutonServer
  def self.start(args)
    param = InputLoader.read_input_args(args)
    ServiceManager.start_services(param)
  end

  def self.show_help
    puts "Usage:"
    puts "    teuton-server [help|version] [PATH/TO/server.yaml]"
    puts "Params:"
    puts "    help       , show this help"
    puts "    init       , Create server.yaml"
    puts "    version    , show current version"
    puts "    configfile , YAML server configuration file"
    exit 0
  end

  def self.show_version
    puts "teuton-server => " + Rainbow("version 0.0.1").cyan
    exit 0
  end

  def self.init(arg)
    src = File.join(File.dirname(__FILE__), 'server', 'files', 'server.yaml')
    dest = File.join( 'server.yaml')
    if File.exists? dest
      puts "teuton-server => " + Rainbow("File \'#{dest}\' exists!").red
      exit 1
    end
    FileUtils.cp(src, dest)
    puts "teuton-server => " + Rainbow("Init \'#{dest}\' done!").yellow
    exit 0
  end
end
