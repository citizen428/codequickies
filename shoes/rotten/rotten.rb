=begin
  A  small app which does ROT13.

  Author: Michael Kohl <citizen428@gmail.com>

  http://the-shoebox.org/apps/131
=end

Shoes.app :title => "Rotten v0.1", :width => 400 do

  def rot13(text)
    text.tr! "A-Za-z", "N-ZA-Mn-za-m"
  end

  @usage = <<USAGE
Paste - Copies clipboard text into the edit box
Copy - Copies the scrambled text into the clipboard
USAGE

  stack :margin => 10 do
    para @usage
    @input = edit_box :width => 375
  end

  flow :margin => 10 do
    button('Scramble') { @output.text = rot13(@input.text) }
    button('Clear') { @output.text, @input.text = '' }
    button('Paste') { @input.text = self.clipboard }
    button('Copy') { self.clipboard = @output.text }
  end
  
  stack(:margin => 10) { @output = para }
end
