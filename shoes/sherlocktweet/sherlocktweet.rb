Shoes.setup do
  gem 'rest-client'
  gem 'json'
end

require 'twitter_search'
 
OPTS = { :title => "Sherlock Twitter", :width => 300, :height => 500, :resizable => false } 
COLORS = { :bg_a => "burlywood", :bg_b => "olive" }

Shoes.app OPTS do
  extend TwitterSearch
    
  tweets = []
  
  flow :height => "60px", :scroll => false do 
  @terms = edit_line('Search term', :width => "50%")
  @items = edit_line('15', :width => "10%" )
  button 'Search' do
    @res.clear
    cnt = @items.text.to_i
    tweets = twitter_search(@terms.text, cnt)
    
    if tweets.length > 0
      @res = stack do
        cnt.times do |i|  
          stack do
            eval "background #{i % 2 == 0 ? COLORS[:bg_a] : COLORS[:bg_b]}"
            flow :margin => 10 do 
              image tweets[i].avatar, :width => '10%'
              para tweets[i].text
            end
            para "#{tweets[i].screen_name} (#{tweets[i].ago})"
          end
        end  
      end
    else
      alert("Something went wrong, I got no search results!") if tweets.length == 0
    end
  end
  end
    @res = stack
end