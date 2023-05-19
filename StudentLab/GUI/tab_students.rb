require 'glimmer-dsl-libui'
require './controller/tab_students_controller'

class TabStudents
  include Glimmer

  def initialize
    @controller = TabStudentsController.new(self)
  end

  def on_create
    
  end

  def create
    root_container = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false

        form {
          stretchy false

          @filter_last_name_initials = entry {
            label 'Фамилия И. О.'
          }

          @filters = {}
          fields = [[:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

          fields.each do |field|
            @filters[field[0]] = {}

            @filters[field[0]][:combobox] = combobox {
              label "#{field[1]} имеется?"
              items ['Не важно', 'Есть', 'Нет']
              selected 0

              on_selected do
                if @filters[field[0]][:combobox].selected == 1
                  @filters[field[0]][:entry].read_only = false
                else
                  @filters[field[0]][:entry].text = ''
                  @filters[field[0]][:entry].read_only = true
                end
              end
            }

            @filters[field[0]][:entry] = entry {
              label field[1]
              read_only true
            }
          end
        }
      }

      # Секция 2
      vertical_box {
        @table = table {

          text_column('Фамилия И. О.')
          text_column('Гит')
          text_column('Контакт')

          editable false

          #тестовые данные
          cell_rows [['Иванов И. И.', 'vanek2', '+79993332222'], ['Петров П. П.', nil, '@petya3'], ['Орлов О. О.', 'orel4', 'orlenok@mail.ru'], ['Комков К. К.', nil, nil]]
        }

        @pages = horizontal_box {
          stretchy false

          button('1')
          button('2')
          button('3')
          label('...') { stretchy false }
          button('15')
        }
      }

      # Секция 3
      vertical_box {
        stretchy false

        button('Добавить') { stretchy false }
        button('Изменить') { stretchy false }
        button('Удалить') { stretchy false }
        button('Обновить') { stretchy false }
      }
    }
    on_create
    root_container
  end
end
