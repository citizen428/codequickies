Shoes.setup do
  gem 'mechanize'
end

require 'mechanize'

=begin
  A  small app which can display either the current xkcd comic or a 
  random one. Why would you use it? Because it shows you the whole 
  comic mouseover text right under the comic’s title, which I find
  quite convenient.

  Author: Michael Kohl <citizen428@gmail.com>

  http://the-shoebox.org/apps/128
=end
Shoes.app :title => "ManWithHat - An xkcd viewer", :width => 700 do

  @agent = WWW::Mechanize.new

  def get_strip_details(page)
    page_content = @agent.get(page)
    # This regex extracts the image source (src, $1), the funny text (title, $2)
    # and the name of the strip (alt, $3)
    image_regex = /<img src=\"(.*)\" title=\"(.*)\" alt=\"(.*)\">/
    image_regex.match(page_content.search("//img[contains(@src,'comics')]").to_s)
    @strip.path, @funny.text, @title.text = $1, $2, $3
  end

  flow :margin => 10, :align => 'center' do
    button 'Latest strip' do
      page = 'http://xkcd.org/'
      get_strip_details(page)
    end
    
    button 'Random strip' do
      page = 'http://dynamic.xkcd.com/comic/random/'
      get_strip_details(page)
    end

    stack do
      @title = caption
      @funny = para
      @strip = image
      @disclaimer = para 'All cartoons and texts used in this application were made by xkcd.com.'
    end
  end
end
