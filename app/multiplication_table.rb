class Multiplication_Table
  def initialize(items_array = [])
    @number_of_items = items_array.length
    @prime_multiplication_table = Array.new(@number_of_items + 1) { Array.new(@number_of_items + 1, 0) }
    build_multiplication_table(items_array)
  end

  def build_multiplication_table primes
    i = 0
    @prime_multiplication_table[0][0] = 'Primes'
    while i < primes.length
      j = i
      @prime_multiplication_table[i + 1][0] = primes[i]
      @prime_multiplication_table[0][i + 1] = primes[i]

      while j < primes.length
        product = primes[i] * primes [j]
        @prime_multiplication_table[i + 1][j + 1] = product
        @prime_multiplication_table[j + 1][i + 1] = product if i != j

        j += 1
      end
      i += 1
    end
  end

  def mult_table
    return @prime_multiplication_table
  end

  def output_table
    format = build_format(@number_of_items)

    for i in @prime_multiplication_table
      STDOUT.write format % i
    end

  end

  def build_format places_to_add
    additional_value = "%-10s "
    format = "%-15s "

    i = 0
    while i < places_to_add
      format = format + additional_value
      i += 1
    end

    format = format + "\n"

    return format
  end
end

