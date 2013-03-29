# Clear any Rails caches on application boot or restart
# this prevents "ghost" frontend assets or views from surviving a restart

puts "Clearing caches if they exist" unless $rails_rake_task
Rails.cache.clear
