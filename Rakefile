require 'bundler/setup'
require 'bundler/gem_tasks'
require 'appraisal'
require 'pry-byebug'
require 'rake/testtask'

require_relative 'test/support/current_bundle'

Rake::TestTask.new('test:acceptance') do |t|
  t.libs << 'test'
  # t.ruby_opts += ['-w', '-r', 'bundler/setup', '-r', './test/report_warnings']
  t.ruby_opts += ['-w']
  t.pattern = 'test/acceptance/**/*_test.rb'
  t.verbose = false
end

task :default do
  if Tests::CurrentBundle.instance.appraisal_in_use?
    Rake::Task['test:acceptance'].invoke
  elsif ENV['CI']
    exec 'appraisal install && appraisal rake --trace'
  else
    appraisal = Tests::CurrentBundle.instance.latest_appraisal
    exec "appraisal install && appraisal #{appraisal} rake --trace"
  end
end
