CfA Dashboard
=============

The goal of this project is to create a dashboard for various CfA-related info.

Currently, this app is using [Dashing](http://shopify.github.com/dashing/), a Sinatra-based dashboard framework developed by Shopify.

#Dashboards
##2013 Fellows
The first dashboard I (Moncef) created was a proof of concept. It has 3 widgets:
  1. The top 10 2013 Fellows who tweet the most, updated daily
  2. A collection of tweets tagged with #cfa2013, updated every 10 minutes
  3. A random fun fact pulled every minute from [randomfunfacts.com](http://www.randomfunfacts.com). 

You can view it here: [http://cfa-dashboard.herokuapp.com/fellows](http://cfa-dashboard.herokuapp.com/fellows)


The Top 10 grabs the Fellows' Twitter usernames from the [CfA API](https://github.com/codeforamerica/cfa_api).

#Local Configuration
This app includes a widget that displays the Top 10 2013 Fellows who tweet the most. In order to display that data locally on your machine (as opposed to viewing it on the production site), you need to have a registered Twitter application (the widget uses your Twitter OAuth credentials via the [Twitter](http://sferik.github.com/twitter/) gem). To register a new application, sign-in using your Twitter account and the fill out the form at [http://dev.twitter.com/apps/new](http://dev.twitter.com/apps/new). If you've previously registered a Twitter application, it will be listed at [http://dev.twitter.com/apps](http://dev.twitter.com/apps).

#Installation
```
bundle

export TWITTER_CONSUMER_KEY=your_consumer_key
export TWITTER_CONSUMER_SECRET=your_consumer_secret
export TWITTER_OAUTH_TOKEN=your_oauth_token
export TWITTER_OAUTH_TOKEN_SECRET=your_oauth_token_secret

dashing start
```

#Browse Locally
Dashboard with Top 10 Tweets and Random Fun Fact: http://localhost:3030/fellows