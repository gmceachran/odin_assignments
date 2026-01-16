array = [5, 3, 1, 4, 2, 6, 7, 8, 9, 10]


def bubble_sort(array)
  for_count = array.length - 1
  loop do 
    swapped = false
  
    for n in array[0..for_count]
      index = array.index(n)
      break if index == array.length - 1
      next_n = array[index + 1]
  
      if n > next_n
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
      end
    end

    break unless swapped
    break if for_count <= 0
    for_count -= 1
  end
  array
end

p bubble_sort(array)