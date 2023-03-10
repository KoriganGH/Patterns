# 12)Дан целочисленный массив. Необходимо переставить в обратном
# порядке элементы массива, расположенные между его минимальным и
# максимальным элементами.

def reverse_between_min_max(arr)
  min_index = arr.index(arr.min)
  max_index = arr.index(arr.max)

  sub_arr = arr[(min_index+1)...max_index].reverse

  arr[(min_index+1)...max_index] = sub_arr

  return arr
end


#24)Дан целочисленный массив. Необходимо найти два наибольших
#элемента.

def find_two_max(arr)
  max1 = arr.max
  arr.delete(max1)
  max2 = arr.max
  return [max1, max2]
end


#36)Дан целочисленный массив. Необходимо найти максимальный
#нечетный элемент.

def find_max_odd(arr)
  odd_arr = arr.select(&:odd?)
  max_odd = odd_arr.max
  return max_odd
end


#48)Для введенного списка построить список с номерами элемента, который
#повторяется наибольшее число раз.

def find_most_frequent(arr)
  count = arr.group_by(&:itself).transform_values(&:count)
  max_count = count.values.max
  result = arr.each_with_index.select { |num, index| count[num] == max_count }.map(&:last)
  return result
end


#60)Дан список. Построить массив из элементов, делящихся на свой
#номер и встречающихся в исходном массиве 1 раз.

def find_elements(array)
  array.select.with_index { |num, i| num % i == 0 && array.count(num) == 1 if i != 0}
end


method_choice = gets.chomp.to_i
array = [1,2,3,4,5,6,7,8,9]

case method_choice
  when 1
    result = reverse_between_min_max(array)
  when 2
    result = find_two_max(array)
  when 3
    result = find_max_odd(array)
  when 4
    result = find_most_frequent(array)  
  when 5
    result = find_elements(array)
  else
    puts "Некорректный выбор метода"
    return
  end
