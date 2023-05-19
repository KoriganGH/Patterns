require 'glimmer-dsl-libui'

class MainWindow
  include Glimmer
  def create
    window('Университет', 600, 200) {
      tab {
        tab_item('Студенты') {
          tab_students
        }

        tab_item('Вкладка 2') { }
        tab_item('Вкладка 3') { }
      }
    }
  end
end
