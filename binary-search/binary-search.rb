# [5, 6, 2, 8, 3, 15, 16, 15, 7, 1]

def binary_search (search_element, arr)
  start_index = 0
  end_index = arr.length - 1
  middle_index = ((start_index + end_index) / 2).round()

  print_status(start_index, end_index, middle_index, arr)

  while arr.length > 0 do
    
    if(search_element == arr[middle_index])
      return middle_index;
    end

    if(search_element > arr[middle_index])
      start_index = middle_index + 1;
      middle_index = ((start_index + end_index) / 2).round();
      print_status(start_index, end_index, middle_index, arr)
      next
    end

    if(search_element < arr[middle_index])
      end_index = middle_index - 1;
      middle_index = ((start_index + end_index) / 2).round();
      print_status(start_index, end_index, middle_index, arr)
      next
    end

  end

end

def print_status (start_index, end_index, middle_index, arr) 
  puts
  puts "start index: #{start_index}"
  puts "end index: #{end_index}"
  puts "middle_index: #{middle_index}"
  puts "array : #{arr}"
  puts
end

test_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "result index: #{binary_search(21, test_arr)}"
