# Rpg Dash (music dashboard)

## Installation
Install ruby 2.4, ruby gems, and the gem "bundler". You need sqlite3 too.

    bundle
    rake db:create db:migrate db:seed

## Start

    rails s

## How it works ?
You start the server.
Then you can upload files and set attributes to it.
Then you can use the dashboard to read music randomly given your current preferences (stress, type, etc.)

### Youtube-dl
If you want to enable the youtube-dl option (download files directly from youtube), you must have "youtube-dl" installed on your system. An executable "youtube-dl" must exists on the PATH.

## How to contribute ?
fork & create a pull request.

### Guidelines
This is a ruby on rails 5.1 project.
There are some main files/directories to know:

- app/controllers: the mechanism of the application are there;
- app/models: the database's orm uses models to develop the actions that can be done on data;
- app/views: the html page (templated with SLIM);
- assets: where the CSS and JS is stored. We use coffeescript;
- db/migrations: where we add new table, fields, etc. to the database;
- config/routes: where we set which controller method is an action (accessible with http);

### Behaviour
If you want to contribute, please be nice; if someone looks disrespectful, ignore it.

### Code quality
Your contributions will be reviewed to improve them and avoid craps, bugs, optimization issue, etc.
Code quality is a requirement.
