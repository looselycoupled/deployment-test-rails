# In development mode, Bullet logs suggestions on optimizing
# your database queries to log/bullet.log

if defined? Bullet and Rails.env.development?
  puts "Bullet is logging query suggestions" unless $rails_rake_task
  Bullet.enable = true
  Bullet.bullet_logger = true
end
