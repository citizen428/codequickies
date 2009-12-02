words = Hash.new(0)
DATA.each { |line| line.scan(/\b\w+\b/).each { |w| words[w] += 1 } }
words.sort_by { |e| e[1]}.reverse.each { |k, v| puts "#{k}: #{v}"}