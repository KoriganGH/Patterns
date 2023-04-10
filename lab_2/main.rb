require_relative 'student'
require_relative 'student_short'
require_relative 'data_table'

student1 = Student.new('Иванов', 'Иван', 'Иванович')
student2 = Student.new('Петр', 'Петров', 'Петрович', { id: 2, phone: '79990009999', telegram: 'dotnet', email: 'pochta@mail.ru', git: 'foreveralone' })

student2.set_contacts({ email: 'abced@gm.com', phone: '77776663333' })

puts student1
puts "Valid: #{student1.valid?}"
puts student2
puts "Valid: #{student2.valid?}"

def test_invalid_options(options)
  Student.new('Иванов', 'Иван', 'Иванович', options)
rescue ArgumentError => e
  puts e.message
end

test_invalid_options({ phone: '01010101010' })
test_invalid_options({ email: 'mail.ru' })

student3 = Student.new('Орлов', 'Сергей', 'Олегович', { id: 3, email: 'orel@mail.ru', git: 'orlov228' })
puts student3.to_json_str

puts Student.from_json_str('{"first_name": "Сергеев", "last_name": "Сергей", "father_name": "Сергеевич", "id": 4, "phone": "79998673211"}')

begin
  Student.from_json_str('{"first_name": "Ян", "email":"yan@ya.com"}')
rescue ArgumentError => e
  puts "test 1: #{e.message}"
end

begin
  Student.from_json_str('{"first_name": "Саймонов", "last_name": "Икр", "father_name": "Абдурозович", "id": 4, "phone": "321123321"}')
rescue ArgumentError => e
  puts "test 2: #{e.message}"
end

begin
  Student.from_json_str('Илона')
rescue JSON::ParserError => e
  puts "test 3: #{e.message}"
end

puts student3.get_info

short1 = StudentShort.from_student(student3)
puts short1

def read_from_txt(file_path)
  raise ArgumentError, 'File not found' unless File.exist?(file_path)

  file = File.open(file_path){|file| file.read}
  JSON.parse(file).inject([]) do |list, student|
    list << Student.from_json_str(student.to_json)
  end
end

def write_to_txt(file_path, student_list)
  res = '['
  student_list.each do |st|

    res += st.to_json_str + ","
  end
  res = res.chop + "]"
  File.write(file_path, res)
end

st_list=read_from_txt('students.txt')
st_list.each do |st|
  puts st.get_info
end

write_to_txt('students_out.txt',st_list)
puts read_from_txt('students_out.txt')


test_matrix = [[1, 'Ivan', true], [2, 'Alex', false]]
test_table = DataTable.new(test_matrix)
puts test_table
puts test_table.get_item(0, 1)
