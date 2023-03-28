require_relative 'student'

student1 = Student.new('Иванов', 'Иван', 'Иванович')
student2 = Student.new('Петр', 'Петров', 'Петрович', { id: 2, phone: '79990009999', telegram: 'dotnet', email: 'pochta@mail.ru', git: 'foreveralone' })

student1.to_s
student2.to_s
