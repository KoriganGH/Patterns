require_relative 'student'

student1 = Student.new('Иванов', 'Иван', 'Иванович')
student2 = Student.new('Петров', 'Петр')
student2.phone = '+7 (123) 456-78-90'
student2.telegram = '@petr'
student2.email = 'petya123@mail.com'
student2.git = 'https://github.com/petya123'

student1.to_s
student2.to_s
