timeout 30
preload_app true
worker_processes ENV['UNICORN_PROCESSES'].to_i

if ENV['RAILS_ENV'] == 'development'
  stderr_path 'log/development.log'
end

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master caught SIGTERM, sending self SIGQUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  sleep 1

end

after_fork do |server, worker|

  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  Signal.trap 'TERM' do
    puts 'Unicorn worker caught SIGTERM, ignoring. Waiting for master to send SIGQUIT'
  end

  if ENV['RAILS_ENV'] == 'development'
    puts "Rails is running on 0.0.0.0:#{ENV['PORT']} ✔"
  end

end
