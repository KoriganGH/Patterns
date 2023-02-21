#1
def min_element(arr)
  min = arr[0]
  for i in 1..arr.length-1
    if arr[i] < min
      min = arr[i]
    end
  end
  min
end


def first_positive_element(arr)
  i = 0
  while i < arr.length
    if arr[i] > 0
      return i
    end
    i += 1
  end
  return -1
end
