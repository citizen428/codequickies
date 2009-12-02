require 'restclient'
require 'json'
require 'cgi'

module TwitterSearch   
  Tweet = Struct.new :screen_name, :avatar, :text, :ago
  API_PATH = "http://search.twitter.com/search.json?q="
  
  def time_ago(from_time)
    to_time = Time.now
    from_time = Time.parse(from_time.gsub(',',''))
    distance_in_minutes = (((to_time - from_time).abs)/60).round

    case distance_in_minutes
      when 0..1         then time = "About a minute ago"
      when 2..59        then time = "#{distance_in_minutes} minutes ago"
      when 60..90       then time = "About 1 hour ago"
      when 90..1440     then time = "#{(distance_in_minutes.to_f / 60.0).round} hours ago"
      when 1440..2160   then time = '1 day ago' # 1-1.5 days
      when 2160..2880   then time = "#{(distance_in_minutes.to_f / 1440.0).round} days ago" # 1.5-2 days
      else time = from_time.strftime("%a, %b %d %Y")
    end
    time
  end
  
  def twitter_search(terms, items)
    tweets = []     
    items = items > 100 ? 100 : items
    params = "&rpp=#{items}&pages=1"
    
    json = JSON.parse RestClient.get("#{API_PATH}#{CGI::escape(terms)}#{params}")
    
    json['results'].each do |t|
      tweets << Tweet.new(t['from_user'], t['profile_image_url'], 
        t['text'], time_ago(t['created_at']))
    end
    tweets
  end
end