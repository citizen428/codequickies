class CardGame
  DECK = %w[A 2 3 4 5 6 7 8 9 T J Q K].product(%w[c d h s]).map(&:join)
  
  def initialize(decks=1)
    @decks = decks
  end
  
  def shuffle
    @playing_deck = (DECK*@decks).shuffle
  end
  
  def deal(players=1, cards=5)
    shuffle
    @dealt = Array.new(players) { Array.new }
  
    @dealt.map { |hand| cards.times { hand << @playing_deck.pop } }
  end
  
  def display
    @dealt.each_with_index { |cards, i| puts "Player #{i+1}: #{cards.join(' | ')}" }
    puts "Cards used: #{@dealt.flatten.size}"
    puts "Cards remaining: #{@playing_deck.size}"
  end
  
  private :shuffle
end

game1 = CardGame.new
game1.deal
game1.display 
puts
game1.deal(4)
game1.display
puts
game2 = CardGame.new(2)
game2.deal(6,10)
game2.display