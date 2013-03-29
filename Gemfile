source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '~> 3.2.0'

# CORE SYSTEM
gem 'unicorn'                         # Multi-process rack server
gem 'pg'                              # Postgres
gem 'seed-fu', '~> 2.1'               # Database seeding plans
gem 'dalli'                           # Memcached integration
gem 'paperclip', '~> 3.4.0'           # Uploaded asset management and thumbnail processing
gem 'aws-sdk'                         # Required for Paperclip to talk to Amazon S3

# ASSET PIPELINE
gem 'bourbon'                         # Sass mixins from Thoughtbot
gem 'compass-rails'                   # Sass mixins and spriting engine from Compass
gem 'oily_png'                        # PNG exporting for Compass
gem 'sass-rails', '~> 3.2.0'          # Sass preprocessing
gem 'uglifier'                        # Preprocessing asset compressor used by Heroku

# ACTIVE ADMIN
gem 'activeadmin', '~> 0.5.0'         # CMS interface
gem 'coffee-rails', '~> 3.2'          # .coffee -> .js file processing (ActiveAdmin 0.5 requires)
gem 'meta_search', '>= 1.1.0.pre'     # Required for Active Admin
gem 'redcarpet'                       # Markdown formatting
gem 'to_csv'                          # Allows custom CSV rendering

# PRODUCTION-ONLY GEMS
group :production do
  gem 'newrelic_rpm'                  # New Relic performance monitoring
end

# AUDITING OR DEVELOPMENT-ONLY GEMS
group :development do
  gem 'better_errors'                 # Very pretty error screens
  gem 'binding_of_caller'             # Adds REPL support to better_errors
  gem 'brakeman'                      # Static security audits
  gem 'bullet'                        # Reporting on N+1 and unoptimized queries
  gem 'holepicker'                    # Check for security vulnerable gems
  gem 'yard'                          # Generate nice documentation
end

# VALIDATORS
# gem 'valid_email'                     # Powerful e-mail address validator

# TWITTER SUPPORT
# gem 'twitter'                         # Twitter API support
# gem 'twitter-text'                    # Adds inline links to tweet bodies
# gem 'oj', '~> 1.3.0'                  # Speeds up Twitter gem

# OTHER USEFULS
# gem 'turbolinks'                      # PJAX-like workflow for page changes
# gem 'color'                           # Hex/RGB color manipulation and math
# gem 'dynamic_form'                    # Add error classes to form elements
# gem 'exception_notification'          # Email exceptions raised in production to someone
# gem 'skeptick'                        # Image composition using ImageMagick
# gem 'kaminari'                        # Awesome pagination
# gem 'abacus_count'                    # Assist Kaminari with counting complex queries
# gem 'puma'                            # Alternative thread-based Rack server
