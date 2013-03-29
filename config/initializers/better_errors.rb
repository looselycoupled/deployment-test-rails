if Rails.env.development?
  BetterErrors::Middleware.allow_ip! "10.0.0.0/16"
  BetterErrors::Middleware.allow_ip! "192.168.0.0/16"
end
