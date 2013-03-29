# Automatically rotate the Rails asset version on code deploy.
# This solution is appropriate for most Threespot
# clients, but probably not sustainable for millions of unique visors per day
# Changing a single file inside /app/assets will invalidate ALL frontend assets

Rails.configuration.assets.version = begin
  files = Dir["#{Rails.root}/app/assets/**/*"].reject{|f| File.directory?(f)}.sort
  content = files.map{|f| File.read(f)}.join
  Digest::MD5.hexdigest(content)
end
