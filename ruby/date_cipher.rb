letters = [*'A'..'Z']

msg = 'RUBY PROGRAMMING IS FUN!'
date = '09262134'

transform = -> string, encrypt=true do
  i = -1
  string.each_char.map do |c|
    if letters.index(c) 
      shift = date[(i+=1)%date.length].to_i
      shift *= -1 unless encrypt
      letters[(letters.index(c)+shift)%letters.length]
    else
      c
    end
  end.join
end

msg # => "RUBY PROGRAMMING IS FUN!"
crypt = transform[msg] # => "RDDE RSRKRJOSKOJ MS OWT!"
decrypt = transform[crypt, false] # => "RUBY PROGRAMMING IS FUN!"
