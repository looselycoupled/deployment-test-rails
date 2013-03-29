Shortline::Application.configure do

  # Code is not reloaded between requests
  config.cache_classes = true

  # Use Dalli for memory caching
  config.cache_store = :dalli_store

  # Log to STDOUT (required for Unicorn)
  config.logger = Logger.new(STDOUT)

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  # throw an exception instead
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Cache control headers for static files
  # 604800 seconds = 1 week
  config.static_cache_control = "public, max-age=604800"

  # Precompile additional assets by adding them to this array
  # You can use wildcards, ex. libs/* or themes/*.scss
  # application.js, application.css, and all non-JS/CSS are already added
  config.assets.precompile += %w[
    active_admin/print.css
    active_admin.css
    active_admin.js
    main.js
    require.js
    lib/*.js
    modules/*.js
    application.css
  ]

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Eager load the application namespaces if Rails is running as a rake task
  config.dependency_loading = true if $rails_rake_task

  # Force production SSL for devise and user auth controllers
  config.to_prepare { Devise::SessionsController.force_ssl }
  config.to_prepare { Devise::RegistrationsController.force_ssl }
  config.to_prepare { Devise::PasswordsController.force_ssl }

  # If you're using ExceptionNotifier you need to configure it here
  # to recieve exceptions thrown on production
  # config.middleware.use ExceptionNotifier, {
  #   sender_address: %{"Rails" <rails@example.com>},
  #   email_prefix: "[JOBCODE] ",
  #   exception_recipients: %w[
  #     example@threespot.com
  #   ],
  # }

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

end
