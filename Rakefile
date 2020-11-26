# encoding: utf-8

require 'rubygems'

require 'rubygems/tasks'
Gem::Tasks.new

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

task :test    => :spec
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new  
task :doc => :yard
