# Owl-insurance-fulfilment-api

## Getting Started
Run the setup script to install dependencies and get the app running on your machine
:
    % ./bin/setup

After setting up, you can run the application using [Heroku Local]:

    % heroku local

Learn more about [Heroku Local](https://devcenter.heroku.com/articles/heroku-local)

## Guidelines
Use the following guide for programming well, programming in style and getting things done:

* [DVELP Cookbook](https://github.com/DVELP/cookbook)

## Specs & Linting
CI is setup to run both linting and rspec. To avoid unnecessary delay with code
reviews ensure you run `bin/rake` before raising a pull request.

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    % ./bin/deploy staging
    % ./bin/deploy production
