letters = [*'a'..'z']+[*'A'..'Z']
def letters.rotate(x)
  new_a = self.dup
  x.times {new_a.push new_a.shift}
  new_a
end

transform = -> str, encrypt do
  if encrypt
    subst = Hash[letters.zip(letters.rotate(rot=rand(25)+1))]
    enc ||= str.each_char.map{|i| letters.include?(i) ? subst.key(i) : i}.join
    # Add extra character to store rotation offset
    enc << (97+rot).chr
  else
    # Retrieve rotation offset before decrypting
    subst = Hash[letters.zip(letters.rotate(str[-1].ord - 97))]
    str[0..-2].each_char.map{|i| letters.include?(i) ? subst[i] : i}.join
  end
end

raw_input = -> prompt {print prompt; STDIN.gets.chomp}

case ARGV[0]
  when /-e/ then puts transform[raw_input["Encrypt string: "], true]
  when /-d/ then puts transform[raw_input["Decrypt string: "], false]
  else puts "Use '#{$0} -e' for encrypting and '#{$0} -d for decrypting!'"
end
