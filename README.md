# Frontend Boilerplate

Lightweight environment for frontend development. Includes cucumber and jasmine for BDD.

## Installation

Clone the repo:

    $ git clone git://github.com/flskif/frontend-boilerplate.git YOUR_APP

Navigate to your brand new app:

    $ cd YOUR_APP

Install required gems:

    $ bundle install

To run jasmine tests using ```jasmine-headless-webkit``` you'll need Qt. Install it with ```brew install qt``` or with macports ```sudo port install qt4-mac```.

## What's included

 * Web sever with Sprockets to support on-the-fly Slim/CoffeScript/SASS compilation. Start it with ```rackup```. It will start on ```http://0.0.0.0:9292```.
 * Live reload support. No plugins required, works in every browser (including iOS Safari). Start it with ```guard -P livereload```, and when you save file, webpage with app will automatically reload.
 * Cucumber test runner. Run it manually with ```cucumber```.
 * Cucumber test auto runner. Will re-run test when you save test-related files. Start with ```guard -P cucumber```.
 * Jasmine headless test runner. Run it manually with ```jasmine-headless-webkit```. If you need html runner for inspection, latest run is saved as ```tmp/jasmine_runner.html```.
 * Jasmine tests auto-runner. Run it with ```guard -P jasmine-headless-webkit```.
