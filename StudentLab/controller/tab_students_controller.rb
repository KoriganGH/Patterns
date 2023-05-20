require './GUI/main_window'
require './repositories/student_repository'
require './repositories/adapter/db_source_adapter'
require './repositories/containers/data_list_student_short'
require './GUI/student_input_form'
require 'win32api'

class TabStudentsController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_listener(@view)
  end

  def on_view_created
    begin
      @student_rep = StudentRepository.new(DBSourceAdapter.new)
    rescue Mysql2::Error::ConnectionError
      on_db_conn_error
    end
  end

  def show_view
    @view.create.show
  end

  def show_modal_add
    controller = StudentInputFormControllerCreate.new(self)
    view = StudentInputForm.new(controller)
    controller.set_view(view)
    view.create.show
  end

  def show_modal_edit(current_page, selected_row)

  end

  def delete_selected(current_page, per_page, selected_row)
    begin
      student_num = (current_page - 1) * per_page + selected_row
      @data_list.select_element(student_num)
      student_id = @data_list.selected_id
      @student_rep.remove_student(student_id)
    rescue
      on_db_conn_error
    end
  end
  
  def refresh_data(page, per_page)
    begin
      @data_list = @student_rep.paginated_short_students(page, per_page, @data_list)
      @view.update_student_count(@student_rep.student_count)
    rescue
      on_db_conn_error
    end
  end

  private

  def on_db_conn_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    exit(false)
  end
