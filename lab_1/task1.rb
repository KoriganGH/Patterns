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

puts "Введите команду на языке Ruby:"
ruby_command = gets.chomp

puts "Результат выполнения команды на языке Ruby:"
eval(ruby_command)

puts "Введите команду операционной системы:"
os_command = gets.chomp

puts "Результат выполнения команды операционной системы:"
system(os_command)

