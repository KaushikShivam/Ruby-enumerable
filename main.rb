module Enumerable
  
  # my each
  def my_each
    count = 0
    while count < length
      yield(self[count])
      count += 1
    end
    self
  end
  
  # my_each_with_each
  def my_each_with_index
    count = 0
    while count < length
      yield(self[count], count)
      count += 1
    end
    self
  end
  
  # my_select
  def my_select
    count = 0
    arr = []
    while count < length
      arr.push(self[count]) if yield(self[count])
      count += 1
    end
    arr
  end
  
  # my_all
  def my_all?
    count = 0
    while count < length
      count += 1
      return false unless yield(self[count])
      
    end
    true
  end
  
  # my_any?
  def my_any?
    count = 0
    while count < length
      count += 1
      return true if yield(self[count])
    end
    false
  end
  
  # my_none?
  def my_none?
    count = 0
    while count < length
      false if yield(self[count])
      count += 1
    end
    true
  end
  
  # my_count
  def my_count
    count = 0
    index = 0
    if block_given?
      while index < length
        count += 1 if yield(self[index])
        index += 1
      end
    else
      while index < length
        count += 1
        index += 1
      end
    end
    count
  end
  
  # my_map
  def my_map(proc = nil)
    count = 0
    map_arr = []
    while count < length
      if !proc.nil?
        map_arr.push(proc.call(self[count]))
      else
        map_arr.push(yield(self[count]))
      end
      count += 1
    end
    map_arr
  end
  
  # my_inject
  def my_inject(initial = nil)
    count = 0
    while count < length
      if initial.nil?
        count += 1
        initial = yield(self[0], self[count])
      else
        initial = yield(initial, self[count])
      end
      count += 1
    end
    initial
  end
    
end

# multiply_els method -> multiply_els([2,4,5]) #=> 40
def multiply_els(array)
  array.my_inject { |total, item| total * item }
end
