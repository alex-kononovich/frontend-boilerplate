Lightweight environment for frontend development
================================================

Ideal for use with [LiveReload](http://livereload.com) - light, quick, your page will reload instantly.
Sinatra application.
Assets are served with sprockets.

Getting started
-----------

Clone the repo

```
$> git clone git://github.com/flskif/frontend-boilerplate.git YOUR_APP
```

Navigate to you brand new app

```
$> cd YOUR_APP
```

Install required gems

```
$> bundle install
```

And start server

```
$> rackup
```


Tools included
---------------
Slim, SASS + Compass, CoffeeScript, Jasmine for testing.

Jasmine
-------
Contains patch for jasmine, so just run ```rake jasmine``` to start jasmine server.


Mimic Rails
-----------
Folder structure made to match rails, so your code can be easly transferred later to rails application.
