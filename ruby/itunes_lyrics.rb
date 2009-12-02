equire 'rbosa'
 
song = OSA.app('iTunes').current_track.name.gsub(/\(.*\)/, '').gsub(/\s/,'%20')
system("open -a Safari http://www.google.com/search?q=#{song}+lyrics")