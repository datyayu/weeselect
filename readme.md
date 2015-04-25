# Boom
A quick project bootstraper so you can start coding as soon as you have an idea.

## What includes?
- Twitter Bootstrap
- jQuery
- Angular
- Angular-ui-router
- coffeescript express server
- gulp-tasks
  1. Sass & Coffescript compilation and minification.
  2. Libs concatenation
  3. Livereload server.

## How to use
First than all, we need to install the dependencies
```
$ npm install
$ bower install
```
Then we can run gulp tasks
```
$ gulp dev
```
for development. Or
```
$ gulp build
```
for production.

Boom also includes an static server so you can run it using
```
$ coffee app/server.coffee
```

## TO DO / Future updates
- Add tests support
- Improve static server
- Create a yeoman generator
