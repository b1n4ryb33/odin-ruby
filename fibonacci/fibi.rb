def fibs n
  
  fibi = Array.new(n)
  
  0.upto(n) {|i|

    if(i == 0 || i == 1) then
      fibi[i] = i
      next
    end

    fibi[i] = fibi[i-1] + fibi[i-2]
  }

  fibi

end

def fibs_rec n

  if (n == 1)
    return [0, 1];
  end

  fibi_arr = fibs_rec(n-1);
  
  fibi_arr << fibi_arr[-2] + fibi_arr[-1] 
end

p fibs 30
p fibs_rec 30