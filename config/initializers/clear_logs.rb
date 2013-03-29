# config/initializers/clear_logs.rb
# https://gist.github.com/885671
# This snippet simply clears your logs when they are too large.
# Large logs mean looooong search in TextMate. You know it :)
# Every time you run rails server or rails console it checks log sizes 
# and clears the logs for you if necessary.

if Rails.env.development?
  MAX_LOG_SIZE = 2.megabytes
  DEVELOPMENT_LOG = "#{Rails.root}/log/development.log"
  if File.size?(DEVELOPMENT_LOG).to_i > MAX_LOG_SIZE
    puts "log/development.log is very large; clearing"
    File.open(DEVELOPMENT_LOG, 'w') {|file| file.truncate(0)}
  end
end
