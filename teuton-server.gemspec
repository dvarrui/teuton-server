require_relative 'lib/teuton-server/application'

Gem::Specification.new do |s|
  s.name        = Application::NAME
  s.version     = Application::VERSION
  s.date        = '2019-11-09'
  s.summary     = "TeutonServer (Teuton Software)"
  s.description = "TeutonServer listens and responds TeutonClients request"

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'teuton.software@protonmail.com'
  s.homepage    = 'https://github.com/dvarrui/teuton-server'

  s.executables << 'teuton-server'
  s.files       = %w[lib/teuton-server/files/teuton-server.yaml
                   lib/teuton-server/application.rb
                   lib/teuton-server/input_loader.rb
                   lib/teuton-server/service_manager.rb
                   lib/teuton-server/service.rb
                   lib/teuton-server.rb]

  s.add_runtime_dependency 'rainbow', '~> 3.0'
  s.add_development_dependency 'minitest', '~> 5.11'
end
