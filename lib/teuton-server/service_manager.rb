
require_relative 'service'

module ServiceManager
  def self.start_services(app_param)
    show_starting(app_param)
    services_param = split_app_param_into_services_param(app_param)
    services = []
    begin
      services_param.each do |param|
        services << Thread.new{ Service.new.run(param) }
      end
      services.each { |service| service.join }
    rescue SystemExit, Interrupt
      puts Rainbow("\nteuton-server => Closing...").bright
      exit 0
    end
  end

  def self.show_starting(param)
    puts Rainbow("teuton-server => Starting...").bright
    puts "                 Configfile : #{param[:server][:configfile]}"
    puts "                 Listen on  : #{param[:server][:ip]}:#{param[:server][:port]}"
    puts "                 Test list  : #{param[:server][:testunits].join(',')}"
    puts Rainbow("                 (CTRL+C to exit)").bright.yellow
  end

  def self.split_app_param_into_services_param(app_param)
    services_param = []
    app_param[:clients].each_with_index do |client, index|
      param = { server: {}, client: {} }
      param[:server].merge! app_param[:server] if app_param[:server]
      param[:server][:hostname] = param[:server][:ip]
      param[:client].merge! client
      param[:client][:id] = index + 1
      param[:server][:port] += param[:client][:id]
      services_param << param
    end
    services_param
  end
end
