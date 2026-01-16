arr = [89, 12, 45, 67, 23, 12, 98, 34, 56, 78, 9, 45, 23, 67, 100, 1, 55, 34, 78, 23, 89, 11, 44, 66, 88]

def bubble_sort(arr)
  return arr if arr.nil? || arr.length < 2
  arr = arr.dup
  n = arr.length - 1
  loop do
    swapped = false
    n.times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
    n -= 1
  end
  arr
end

p bubble_sort(arr)