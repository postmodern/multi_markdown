# encoding: utf-8

require 'rubygems'

require 'rubygems/tasks'
Gem::Tasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec:multi_markdown') do |spec|
  spec.exclude_pattern = 'spec/libraries/*_spec.rb'
end
task :spec => 'spec:multi_markdown'

namespace :spec do
  Dir.glob('spec/libraries/*_spec.rb') do |file|
    name = File.basename(file).chomp('_spec.rb')
    gemfile = "Gemfile.#{name}"

    namespace :libraries do
      namespace name do
        task :bundle_install do
          sh({'BUNDLE_GEMFILE' => gemfile}, 'bundle', 'install')
        end
      end

      desc "Run RSpec code examples, but with #{name} enabled"
      task name => "#{name}:bundle_install" do
        sh({'BUNDLE_GEMFILE' => gemfile}, 'bundle', 'exec', 'rspec', file)
      end
    end

    task :libraries => "spec:libraries:#{name}"
  end
end

task :spec    => 'spec:libraries'
task :test    => :spec
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new  
task :doc => :yard
