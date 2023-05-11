class DataList
  private_class_method :new
  
  attr_writer :objects
  
  def initialize(objects)
    self.objects = objects
  end

  def select_element(number)
    self.selected_num = number < objects.size ? number : nil
  end

  def selected_id
    objects[selected_num].id
  end

  def column_names
    raise NotImplementedError('Должен быть реализован в дочернем')
  end

  def data_table
    result = []
    counter = 0
    objects.each do |obj|
      row = []
      row << counter
      row.push(*table_fields(obj))
      result << row
      counter += 1
    end
    DataTable.new(result)
  end

  protected

  def table_fields(_obj)
    raise NotImplementedError('Должен быть реализован в дочернем')
  end

  private

  attr_reader :objects
  attr_accessor :selected_num
end
