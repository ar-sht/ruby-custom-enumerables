module Enumerable
  # Your code goes here
  def my_each_with_index
    return self.to_enum unless block_given?

    i = 0
    for elem in self
      yield elem, i
      i += 1
    end
  end

  def my_select
    return self.to_enum unless block_given?

    output = []
    for elem in self
      if yield elem
        output << elem
      end
    end
    output
  end

  def my_all?
    return self.to_enum unless block_given?

    for elem in self
      return false unless yield elem
    end
    true
  end

  def my_any?
    return self.to_enum unless block_given?

    cool = false
    for elem in self
      cool = true if yield elem
    end
    cool
  end

  def my_none?
    return self.to_enum unless block_given?

    for elem in self
      return false if yield elem
    end
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    for elem in self
      count += 1 if yield elem
    end
    count
  end

  def my_map(&func)
    mapped_enum = []
    if block_given?
      for elem in self
        mapped_enum << yield(elem)
      end
    else
      for elem in self
        mapped_enum << func.call(elem)
      end
    end
    mapped_enum
  end

  def my_inject(init_val)
    total = init_val

    for elem in self
      total = yield total, elem
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.to_a unless block_given?

    for elem in self
      yield elem
    end
  end
end
