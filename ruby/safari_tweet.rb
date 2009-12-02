#!/usr/bin/ruby -W0

=begin
  Quick and dirty way to tweet the currently active 
  Safari tab (title + shortened URL). Hashtags get
  passed in as parameters (the hash sign gets added
  by the script, so don't do it yourself)

  Adapt to your needs!
=end

# I don't believe in requiring rubygems itself
#require 'rubygems'
require 'highline'
require 'rbosa'
require 'ShortURL'
gem('twitter4r', '0.3.0')
require 'time'
require 'twitter'

# OSA stuff to get to the active Safari tab
OSA.utf8_strings = true
tab = OSA.app('Safari').windows.first.current_tab

tweet = "#{tab.name} - #{ShortURL.shorten(tab.url)} "
ARGV.each { |tag| tweet << "##{tag} " }

unless tweet.length < 140
  puts "Tweet too long :-("
  exit 1
end

# I didn't feel like having my pw in the file
# therefore using highline to ask for it
hl = HighLine.new
twitter_user = 'citizen428'
twitter_pass = hl.ask('Enter password: ') { |q| q.echo = "*" }

# post tweet
client = Twitter::Client.new(:login => twitter_user, :password => twitter_pass)
Twitter::Status.create(:text => tweet, :client => client)
