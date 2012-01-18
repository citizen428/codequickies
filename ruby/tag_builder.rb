def tag_builder(t)
  lambda do |*args|
    attrs = args.last.is_a?(Hash) ? args.pop : {}
    attr_string = " #{attrs.map { |k,v| "#{k}=\"#{v}\"" }.join (' ')}".rstrip
    "<#{t}#{attr_string}>#{args.join(' ')}</#{t}>"
  end
end

title = tag_builder("h1")
para = tag_builder("p")
link = tag_builder("a")
bold = tag_builder("b")

puts title["Test"]
puts para["This is a paragraph"]
puts link["A link", :href => "http://foo.com"]
puts para[bold["Bold text with", link["a link", :href => "http://bar.com"], "inside a paragraph."]]
