# encoding: utf-8

require 'rubygems'
require 'rake'

begin
  gem 'rubygems-tasks', '~> 0.2'
  require 'rubygems/tasks'

  Gem::Tasks.new
rescue LoadError => e
  warn e.message
  warn "Run `gem install rubygems-tasks` to install 'rubygems/tasks'."
end

begin
  gem 'rspec', '~> 2.4'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new('spec:multi_markdown') do |spec|
    spec.pattern = 'spec/multi_markdown_spec.rb'
  end
  task :spec => 'spec:multi_markdown'

  Dir.glob('spec/libraries/*_spec.rb') do |path|
    name = File.basename(path).chomp('_spec.rb')

    namespace :spec do
      RSpec::Core::RakeTask.new(name) do |spec|
        spec.pattern = path
      end
    end

    task :spec => "spec:#{name}"
  end
rescue LoadError => e
  task :spec do
    abort "Please run `gem install rspec` to install RSpec."
  end
end

task :test => :spec
task :default => :spec

begin
  gem 'yard', '~> 0.7'
  require 'yard'

  YARD::Rake::YardocTask.new  
rescue LoadError => e
  task :yard do
    abort "Please run `gem install yard` to install YARD."
  end
end
task :doc => :yard
