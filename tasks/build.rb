# frozen_string_literal: true

namespace :build do
  desc 'Build gem'
  task :gem do
    puts "[ INFO ] Building gem..."
    system('rm teuton-server-*.*.*.gem')
    system('gem build teuton-server.gemspec')
  end

  desc 'Generate docs'
  task :docs do
    puts "[ INFO ] Generating documentation..."
    system('rm -r html/')
    system('yardoc lib/* -o html ' +
         '--files docs/installation.md,docs/start.md,docs/configfile.md')
  end
end
