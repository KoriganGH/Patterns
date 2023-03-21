class Student
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

  def id
    @id
  end

  def id=(id)
    @id = id
  end

  def last_name
    @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def first_name
    @first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def middle_name
    @middle_name
  end

  def middle_name=(middle_name)
    @middle_name = middle_name
  end

  def phone
    @phone
  end

  def phone=(phone)
    @phone = phone
  end

  def telegram
    @telegram
  end

  def telegram=(telegram)
    @telegram = telegram
  end

  def email
    @email
  end

  def email=(email)
    @email = email
  end

  def git
    @git
  end

  def git=(git)
    @git = git
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@last_name}, Имя: #{@first_name}, Отчество: #{@middle_name}, Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Гит: #{@git}"
  end
end
