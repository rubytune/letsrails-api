# Lets Rails API

This is a sample Rails application that provides the backend API for the [Lets Rails sample app][letsrails].  It is a simple version of [letsbonus.com](http://letsbonus.com).

## Install

You need to install Ruby 1.9.3, Bundler, Redis, MySQL and Memcached.  Once you have that working, you run this app with:

    $ bundle
    $ rake db:setup
    $ foreman start
    
You should then start the [Lets Rails frontend app][letsrails] to use the site.

[letsrails]: http://github.com/livingsocial/letsrails