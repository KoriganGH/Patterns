class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git

  def initialize(last_name, first_name, middle_name = nil)
    @id = nil
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = nil
    @telegram = nil
    @email = nil
    @git = nil
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@last_name}, Имя: #{@first_name}, Отчество: #{@middle_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
