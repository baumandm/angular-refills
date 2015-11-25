# Angular Directives for Bourbon Refills

[![npm](https://img.shields.io/npm/v/angular-refills.svg)](https://www.npmjs.com/package/angular-refills) [![Build Status](https://travis-ci.org/baumandm/angular-refills.svg?branch=master)](https://travis-ci.org/baumandm/angular-refills)

This is a set of Angular.js directives that implement the functionality of [http://refills.bourbon.io/](). This project was created to make it easier to use Bourbon and Refills controls on an Angular.js website.  These directives are designed to work with the default HTML structure and classes as presented on the Refills website.

They are all independent, so you can use only the ones you need.

Refills is owned and maintained by [thoughtbot, inc.](http://thoughtbot.com/). This project is not affiliated in any way.

_This project is currently in a pre-release state, so not all directives have been added._

## How to Use

1. Include Refills in your project and include one or more of the patterns or components

2. Include either the minified or non-minified javascript file from the `/dist/` folder:

    ```html
    <script src="angular-refills.js"></script>
    ```

3. Inject the `angular-refills` module into your app module:

    ```javascript
    var myApp = angular.module('myApp', ['angular-refills']);
    ```

4. The directives will be applied automatically if the default classnames are used.

## Examples

There is an example site in the `example/` folder which can be used for reference.  It uses Gulp to compile the SCSS stylesheets, but the compiled version is also included.

## Bower

This filter can be installed via Bower with the following dependency in the `bower.json` file.

    "dependencies": {
        "angular-refills": "~0.0"
    }

## Browserify

This project is published in NPM as `angular-refills`.

    "dependencies": {
        "angular-refills": "~0.0"
    }


# Building

1. Install [Gulp](http://gulpjs.com/) and [Node.js](http://nodejs.org/)

2. Install Node packages

        npm install

3. Build via Gulp

        gulp build

    The `/dist/` folder contains the regular and minified Javascript files.

4. Tests are automatically run during the build, but they can be run manually as well

        gulp test

