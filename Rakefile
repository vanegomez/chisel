require "rake"
require "rake/testtask"

# Rake::TestTask.new do |t|
#   t.pattern = "test/**/*_test.rb"
# end

task :test do
  Dir.glob('./test/**/*_test.rb') do |file|
    require file
  end
end

task default: [:test]
