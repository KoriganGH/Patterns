puts "Hello World"

user = ARGV[0]
puts "#{user}, какой твой любимый язык программирования?"
case STDIN.gets.chomp
when "Python" 
  puts "Мда..."
when "Ruby" 
  puts "Ну ты и подлиза!"
when "F#" 
  puts "Не верю"
else 
  puts "Я такой не знаю"
end
