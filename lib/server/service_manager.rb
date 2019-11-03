
require_relative 'service'

module ServiceManager
  def self.start_services(param)
    show_starting(param)
    begin
      # Run 1 service
      Service.new.run(param)
    rescue SystemExit, Interrupt
      puts "\nteuton-server => Closing..."
      exit 0
    end
  end

  def self.show_starting(param)
    puts "teuton-server => Starting..."
    puts "                 Configfile #{param[:configfile]}"
    puts "                 Listen #{param[:ip]}:#{param[:port]}"
    puts "                 (CTRL+C to exit)"

    puts param[:server][:testunits].join(',')
  end
end
