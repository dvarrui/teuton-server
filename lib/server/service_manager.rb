
require_relative 'service'

module ServiceManager
  def self.start_services(param)
    Service.new.run(param)
  end
end
