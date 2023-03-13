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
