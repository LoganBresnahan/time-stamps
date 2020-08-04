README

time-stamps is an app that allows users to add youtube videos to their profile and take notes on them.

To run this application:

- Clone the repository and cd into the app.

- Make sure to have Postgres installed on your system. (https://www.postgresql.org/)

- Install Ruby version 2.3.8. You can use a version manager such as rvm, rbenv, or asdf to install different versions of Ruby on your system.

- Once Ruby is installed, install the bundler gem (https://bundler.io/gemfile.html) with the command: ```gem install bundler```

- Create a development database with the command: ```bundle exec rake db:create```

- Migrate the database with the command: ```bundle exec rake db:migrate```

- Spin up a local development server with: ```bundle exec rails server```

You should now be able to visit, http://localhost:3000/ in your browser.
