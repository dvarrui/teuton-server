Gem::Specification.new do |s|
  s.name        = 'teuton-server'
  s.version     = '0.0.0'
  s.executables << 'teuton-client'
  s.executables << 'teuton-server'
  s.date        = '2019-11-08'
  s.summary     = "Teuton Software server and client"
  s.description = "Use TeutonServer to run TeutonSoftware when receive requests from TeutonClient"
  s.authors     = ["David Vargas Ruiz"]
  s.email       = 'teuton.softwware@protonmail.com'
  s.files       = ["lib/teuton-server.rb", "lib/teuton-client.rb"]
  s.homepage    = 'https://rubygems.org/gems/teuton-server'
  s.license     = 'GPL-3.0'
end
