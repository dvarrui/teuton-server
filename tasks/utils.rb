# frozen_string_literal: true

##
# Utility functions
module Utils
  ##
  # Return gems list
  def self.gems
    %w[rainbow minitest]
  end

  ##
  # Check if gems are installed
  # @param gems (Array)
  def self.check_gems(gems)
    fails = filter_uninstalled_gems(gems)
    puts "[ FAIL ] Gems to install!: #{fails.join(',')}" unless fails == []
    puts '[  OK  ] Gems installed.' if fails.size.zero?
  end

  ##
  # Check all tests will be executed.
  def self.check_tests
    testfile = File.join('.', 'tests', 'all.rb')
    a = File.read(testfile).split("\n")
    b = a.select { |i| i.include? '_test' }
    d = File.join('.', 'tests', '**', '*_test.rb')
    e = Dir.glob(d)
    unless b.size == e.size
      puts "[ FAIL ] Some tests aren't includes by #{testfile}"
    end
    puts "[ INFO ] Running #{testfile}"
    system(testfile)
  end

  ##
  # Return gems that aren't installed
  # @param gems (Array)
  def self.filter_uninstalled_gems(gems)
    cmd = `gem list`.split("\n")
    names = cmd.map { |i| i.split(' ')[0] }
    fails = []
    gems.each { |i| fails << i unless names.include?(i) }
    fails
  end

  ##
  # Install gems
  # @param gems (Array)
  def self.install_gems(gems)
    fails = filter_uninstalled_gems(gems)
    if !fails.empty?
      puts '[ INFO ] Installing gems...'
      fails.each do |name|
        system("gem install #{name}")
      end
    else
      puts '[  OK  ] Gems installed.'
    end
  end

  ##
  # Create symbolic link to main executable
  def self.create_symbolic_link
    puts '[ INFO ] Creating symbolic link into /usr/local/bin'
    basedir = File.dirname(__FILE__)
    system("ln -s #{basedir}/teuton-server /usr/local/bin/teuton-server")
  end
end
