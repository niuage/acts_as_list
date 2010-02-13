require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "acts_as_list"
    gem.summary     = %Q{Gem version of acts_as_list Rails plugin}
    gem.description = %Q{Gem version of acts_as_list Rails plugin}
    gem.email       = "bmichel@menfin.info"
    gem.homepage    = "http://github.com/rails/acts_as_list"
    gem.authors     = ["Bruno Michel", "Ryan Bates", "Rails Core"]
    gem.add_dependency "activerecord", ">= 1.15.4.7794"
    gem.add_development_dependency "yard"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new do |t|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""
  t.options += ['--title', "acts_as_list #{version} Documentation"]
end
