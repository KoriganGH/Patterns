class SuperStudentsList
  attr_writer :data_type

  def initialize(data_type)
    self.students = []
    self.seq_id = 1
    self.data_type = data_type
  end

  def load_from_file(file_path)
    hash_list = data_type.str_to_hash_list(File.read(file_path))
    self.students = hash_list.map { |h| Student.from_hash(h) }
    update_seq_id
  end

  def save_to_file(file_path)
    hash_list = students.map(&:to_hash)
    File.write(file_path, data_type.hash_list_to_str(hash_list))
  end

  def student_by_id(student_id)
    students.detect { |s| s.id == student_id }
  end

  def paginated_short_students(page, count, existing_data_list: nil)
    offset = (page - 1) * count
    slice = students[offset, count].map { |s| StudentShort.from_student(s) }

    return DataListStudentShort.new(slice) if existing_data_list.nil?

    existing_data_list.append(*slice)
    existing_data_list
  end

  def sorted
    students.sort_by(&:last_name_and_initials)
  end

  def add_student(student)
    student.id = seq_id
    students << student
    self.seq_id += 1
    student.id
  end

  def replace_student(student_id, student)
    idx = student.find_index { |s| s.id == student_id }
    students[idx] = student
  end

  def remove_student(student_id)
    students.reject! { |s| s.id == student_id }
  end

  def student_count
    students.count
  end

  private

  def update_seq_id
    self.seq_id = students.max_by(&:id).id + 1
  end

  attr_reader :data_type
  attr_accessor :students, :seq_id
end