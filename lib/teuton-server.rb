require 'fileutils'
require 'rainbow'
require_relative 'teuton-server/application'
require_relative 'teuton-server/input_loader'
require_relative 'teuton-server/service_manager'

module TeutonServer
  # Start TeutonServer
  # @param args [Array] List of arguments
  def self.start(args)
    param = InputLoader.read_input_args(args)
    ServiceManager.start_services(param)
  end

  # Show TeutonServer help
  def self.show_help
    puts "Usage:"
    puts "    teuton-server [help|version] [PATH/TO/server.yaml [IP]]"
    puts "Params:"
    puts "    help      , Show this help"
    puts "    version   , Show current version"
    puts "    init      , Create server.yaml config file"
    puts "    CONFIGFILE, YAML server configuration file"
    puts "Example:"
    puts "    Start TeutonServer using 192.168.1.16 IP:"
    puts "          teuton-server server.yaml 192.168.1.16"
    exit 0
  end

  # Show TeutonServer version
  def self.show_version
    puts "teuton-server => " + Rainbow("version #{Application::VERSION}").cyan
    exit 0
  end

  # Create default configuration file
  # @param args [Array] List of arguments, where args.first = 'init'
  def self.init(args)
    folder = '.'
    folder = args[1] if args.size > 1
    src = File.join(File.dirname(__FILE__),
          'teuton-server', 'files', Application::CONFIGFILE)
    dest = File.join(folder, Application::CONFIGFILE)
    if File.exists? dest
      puts "teuton-server => " + Rainbow("File \'#{dest}\' exists!").red
      exit 1
    end
    FileUtils.cp(src, dest)
    puts "teuton-server => " + Rainbow("Init \'#{dest}\' done!").yellow
    exit 0
    # TODO:
    # Add testunits list by default 
    # a = Dir.glob(File.join('projects/gnulinux-basic/**','start.rb'))
  end
end
