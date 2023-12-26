# Notification Trigger App

The Notification Trigger App is a Ruby on Rails application that enables the scheduling of SMS notifications using Twilio after a user signs up. The app utilizes Rails 7 features, Twilio API for sending SMS, and Sidekiq for scheduling background jobs.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Background Jobs](#background-jobs)
- [Test Cases](#test-cases)


## Features

- User sign-up triggers an SMS notification.
- Background jobs using Sidekiq to schedule and process SMS notifications.
- Twilio integration for sending SMS.

## Prerequisites

Make sure you have the following installed:

- Ruby (version 3.1.0)
- Rails (version 7.0.8)
- Redis (for Sidekiq)
- Twilio Account SID and Auth Token

## Installation

1. Install dependencies:

   ```bash
   cd NotificationTriggerApp
   bundle install

## Configuration

1. Configure your Twilio credentials:

   ```bash
   EDITOR=vi bin/rails credentials:edit
   Update the configuration file with the Twilio credentials
   twilio:
    account_sid: 'your_account_sid'
    auth_token: 'your_auth_token'
    phone_number: 'your_twilio_phone_number'

2. Configure your database:

   ```bash
   rails db:create
   rails db:migrate

3. Start Redis server for Sidekiq:

   ```bash
   redis-server

4. Start Sidekiq:

   ```bash
   bundle exec sidekiq

## Usage

1. Start the Rails server:

   ```bash
   rails server

2. Visit http://localhost:3000 in your browser.
3. Sign up as a new user and observe the scheduled SMS notification.

## Background Jobs

1. Background jobs for sending SMS are handled by Sidekiq.Ensure Sidekiq is running.
2. You can monitor Sidekiq at http://localhost:3000/sidekiq.

## Test Cases

This application uses RSpec for testing, and the following gems are employed:

1. RSpec: A testing framework for Ruby.
2. FactoryBot: A library for setting up Ruby objects as test data.
3. Shoulda Matchers: Provides RSpec matchers for common ActiveRecord validations.
4. To run the tests, execute the following command:
   ```bash
   rspec

