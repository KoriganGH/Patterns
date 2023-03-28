class Student
  attr_accessor :last_name, :first_name, :father_name, :id, :phone, :telegram, :email, :git

  def initialize(last_name, first_name, father_name, options = {})
    @last_name = last_name
    @first_name = first_name
    @father_name = father_name
    @id = options[:id]
    @phone = options[:phone]
    @telegram = options[:telegram]
    @email = options[:email]
    @git = options[:git]
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@last_name}, Имя: #{@first_name}, Отчество: #{@middle_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
