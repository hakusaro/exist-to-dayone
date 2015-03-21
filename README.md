# Exist to Day One

[Exist.io](https://exist.io/) offers a mood service, which asks for a rating of each day, on a scale from one to five stars, with a one sentence summary of your day. This script is a **one time use** tool that will export all stored mood values from the Exist API is Day One entires. This is useful, say, if you plan on leaving the service, but don't want to lose your mood data.

## Requirements

* You must have an active [Exist.io](https://exist.io/) account.
* You must have [Day One](https://itunes.apple.com/us/app/day-one/id422304217?mt=12) installed and setup.
* You must have [Ruby](https://rvm.io/rvm/install) installed.

## Caveats

* You cannot get your one sentence summaries out of Exist using the existing API.
* Days with no mood recorded are currently ignored.

## Run

* ```$ git clone https://github.com/nicatronTg/exist-to-dayone.git```
* ```$ cd exist-to-dayone```
* ```$ rvm install 2.0```
* ```$ gem install bundler```
* ```$ bundle install```
* At this stage, it would be wise to backup your journal. In Day One, ```File -> Back Up Journal```.
* ```$ ruby import.rb```
* Enter your username and password when prompted, and give a final go-ahead with enter. When the script completes, Day One should be significantly more populated. This may take a long time to sync to your devices.

## Results

Every mood entry is tagged with #Mood, and the the mood is entered as a star rating, using the Exist scale.

![Results](http://puu.sh/gJen7/6accf0a960.png)