module Enumerable
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for e in self do
      yield e, index
      index += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    for e in self do
      if yield e 
        new_arr << e
      end
    end
    new_arr
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    bool = true
    for e in self do
      unless yield e and bool
        bool = false
      end
    end
    bool
  end

  def my_any?
    return to_enum(:my_all?) unless block_given?

    for e in self do
      if yield e 
        return true
      end
    end
    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    for e in self do
      if yield e
        return false
      end
    end
    true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for e in self do 
      if yield e
        count += 1
      end
    end
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    results = []
    for e in self do
      results << yield(e)
    end
    results
  end

  def my_inject init_value
    return to_enum(:my_inject) unless block_given?
    memo = init_value
    for e in self do
      memo = yield memo, e
    end
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    for e in self do 
      yield e 
    end
    self
  end
end
