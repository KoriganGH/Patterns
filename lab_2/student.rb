class Student
  def self.valid_phone?(phone)
    phone.match(/^\+?[78] ?[(-]?\d{3} ?[)-]?[ -]?\d{3}[ -]?\d{2}[ -]?\d{2}$/)
  end

  attr_accessor :last_name, :first_name, :father_name, :id, :telegram, :email, :git
  attr_reader :phone

  def initialize(last_name, first_name, father_name, options = {})
    self.last_name = last_name
    self.first_name = first_name
    self.father_name = father_name
    self.id = options[:id]
    self.phone = options[:phone]
    self.telegram = options[:telegram]
    self.email = options[:email]
    self.git = options[:git]
  end

  def phone=(new_phone)
    raise ArgumentError, "Invalid argument: phone=#{new_phone}" unless new_phone.nil? || Student.valid_phone?(new_phone)

    @phone = new_phone
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@last_name}, Имя: #{@first_name}, Отчество: #{@middle_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
