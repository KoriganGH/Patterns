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
