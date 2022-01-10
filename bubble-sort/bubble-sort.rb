def bubble_sort(arr)

  length = arr.length
  is_sorted = false
  counter = 0

 while !is_sorted
  
  counter += 1

  was_swapped = false

  for i in 0...length-1 do
    
    if (arr[i] > arr[i+1])
      temp = arr[i]
      arr[i] = arr[i + 1]
      arr[i + 1] = temp
      was_swapped = true
    end

  end 

  is_sorted = was_swapped == false
  
  print arr
  puts "round #{counter}"

  end

arr
end


print bubble_sort([4,3,78,2,0,2])
print bubble_sort([79,2,3,1,700,3,78,2,0,2])
# => [0,2,2,3,4,78]