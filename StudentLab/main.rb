require_relative 'models/student'
require_relative 'models/student_short'
require_relative 'repositories/containers/data_table'
require_relative 'repositories/containers/data_list_student_short'
require_relative 'repositories/super_students_list'
require_relative 'repositories/transform/students_list_json'
require_relative 'repositories/transform/students_list_yaml'
require_relative 'repositories/transform/students_list_txt'
require_relative 'repositories/students_list_db'
require 'json'
require 'yaml'
require 'mysql2'


stud_db = StudentsListDB.new
puts stud_db.student_by_id(2)
puts stud_db.paginated_short_students(1, 2).inspect

# added_id = stud_db.add_student(student4).inspect
# stud_db.replace_student(added_id, student3)
# stud_db.remove_student(added_id)

puts "Студентов в БД: #{stud_db.student_count}"