class Primes_Finder

  def initialize(primes_to_find = 10)
    @primes_to_find = primes_to_find
    @primes = []

    build_primes
  end

  def build_primes
    currently_checking = 2

    while @primes.length < @primes_to_find
      check_up_until = Math.sqrt(currently_checking).floor

      if check_up_until == 1
        @primes.push(currently_checking)
      else
        is_prime = true
        for prime in @primes do
          if prime > check_up_until
            break
          elsif currently_checking % prime == 0
            is_prime = false
            break
          end
        end

        if is_prime
          @primes.push(currently_checking)
        end
      end

      currently_checking = next_number_to_check(currently_checking)
    end
  end

  def next_number_to_check current_number
    next_number = current_number + 1

    return next_number if next_number <= 5

    while next_number % 2 == 0 || next_number % 5 == 0
      next_number += 1
    end

    return next_number
  end

  def number_of_primes_to_find
    return @primes_to_find
  end

  def primes_array
    return @primes
  end
end

