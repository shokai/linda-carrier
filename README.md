Linda Carrier
=============
Launch Linda workers

* https://github.com/shokai/linda-carrier


Dependencies
------------
- Ruby 1.8.7 ~ 2.0.0
- EventMachine
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler foreman
    % bundle install


Workers
-------
put workers into `workers` directory


Run
---

set ENV var "LINDA_BASE" and "LINDA_SPACE"

    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % bundle exec ruby bin/linda-carrier.rb --help
    % bundle exec ruby bin/linda-carrier.rb --base http://linda.shokai.org -space test


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-carrier -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-carrier-main-1.plist

for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-carrier -d `pwd` -u `whoami`
    % sudo service linda-carrier start
