# PROJECT_ROOT = Pathname.new('../..').expand_path(__FILE__).freeze
# $LOAD_PATH << File.join(PROJECT_ROOT, 'lib')
require 'bundler/setup'
require 'pry'
require 'pry-byebug'
require 'warnings_logger'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../lib/shoulda'

WarningsLogger::Spy.call(
  project_name: 'shoulda',
  project_directory: Pathname.new('../..').expand_path(__FILE__),
)

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
  end
end

$VERBOSE = true
