# BaseballStats

Baseball player statistical analysis

## Installation

Add this line to your application's Gemfile:

    gem 'codenamev-baseball-stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codenamev-baseball-stats

## Usage

After installing the gem, running `baseball_stats` from the command-line will
display the results to the following excersize:

1. Most improved batting average from 2009 to 2010
2. Slugging percentage for all players on the Oakland A's in 2007
3. Who was the AL and NL tripple crown winner for 2011 and 2012.  If no one won
   the crown should be "(No winner)"

## NOTES

The first run of the command imports two fairly large CSV files with sample
data into an SQLite3 database.  This may take up to 5 minutes depending on your machine.
