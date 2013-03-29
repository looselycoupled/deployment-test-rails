# Shortline

Shortline is the base Rails CMS build used by Threespot. We like [ActiveAdmin][], [Unicorn][], [Dalli][], [Amazon S3][], [Seed-fu][], and [Paperclip][].

[ActiveAdmin]: http://activeadmin.info
[Unicorn]: http://unicorn.bogomips.org
[Dalli]: https://github.com/mperham/dalli
[Amazon S3]: http://aws.amazon.com/s3/
[Seed-fu]: https://github.com/mbleigh/seed-fu
[Paperclip]: https://github.com/thoughtbot/paperclip

## Getting Started

Shortline assumes you want to develop the Heroku way. You should install the latest [Heroku toolbelt][toolbelt], and you should be running Ruby 1.9.3 or newer. You'll also need image processing tools.

    brew install jpeg pngcrush imagemagick

Establish your Amazon S3 bucket before continuing. (Remember that you need a seperate bucket for each local developer and one for production).

Don't clone this repository! The repository is for making modifications to the base build. Instead, [download this project as an archive][download]. Rename the parent folder how you like (probably to match your jobcode or project name).

### Enviroment Variables

Configure your local enviroment variables for Foreman. Open `env-template` in your favorite editor

    mate env-template

`RAILS_SECRET_TOKEN` needs to be set to a random alphanumeric string of at least 30 characters. Changing this token will invalidate all previous cookies. You also need to provide your S3 credentials for your development bucket. You can also change `PORT` or `UNICORN_PROCESSES` if you need development to run with more concurrency or on a different port.

If you're using other services like the Twitter gem or Mailgun, you may need to also specifiy `TWITTER_*` and `MAILGUN_*` variables here as well. 

When you're done, move the template to the correct filename at `.env`.

    mv env-template .env

You'll also need to set these variables for production with `heroku config:add`. (Choose a different secret token, obviously.)

### Database

Hopefully you're using [Postgres][pgapp]. Make your local database.

    createdb teferi

Now you need to create a database configuration for your local enviroment.

    touch config/database.yml
    mate config/database.yml

If so, your configuration should look something like this:

    development:
      adapter: postgresql
      database: teferi
      host: localhost

### Freezing

Now freeze dependencies inside `vendor`. This will create `Gemfile.lock` for you.

    bundle install --path ./vendor/bundle

### Boot

If everything went OK, you should be able to start the rails server with `foreman start`:

    foreman start
    10:36:38 web.1  | started with pid 1560
    10:36:40 web.1  | Bullet is logging query suggestions
    10:36:40 web.1  | Clearing caches if they exist
    10:36:42 web.1  | Rails is running on 0.0.0.0:5000 ✔

[download]: https://github.com/Threespot/tsm-shortline/zipball/master
[toolbelt]: https://toolbelt.heroku.com
[pgapp]: http://postgresapp.com

## Afterward

You need to check the following files to ensure that they meet client requirements:

    config/application.rb
    config/enviroments/production.rb
    config/initalizers/active_admin.rb
    config/initalizers/devise.rb

Take at look at these files as well:

    assets/stylesheets/active_admin.scss
    assets/javascripts/active_admin.js
    public/robots.txt
    public/humans.txt

## Extra Folders

Some of the project folders are nonstandard, here's what they're for.

- Revision project documentation and notes in `doc/`. (Excluded from slug compilation.)
- Add frontend asset originals and raws to `app/assets/raws/`. (Excluded from slug compilation.)
- `app/assets/fonts` is for any server-side webfont files you might need. Otherwise, feel free to remove this folder.
