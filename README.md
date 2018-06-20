# find-prime-numbers
Ruby app to find first N prime numbers

## Setup
To run the app:

```
 git clone https://github.com/chilphiu/find-prime-numbers
 cd find-prime-numbers
 bundle
```

## Usage
Program returns a 10X10 table with the products of the first 10 prime numbers
```
./primes.rb
./primes.rb -n <int>
```

## Optimizations
First, we can eliminate all evens and anything ending in a 5 from ever being checked. If v % 2 == 0 or v % 5 == 0, we can move on.

Next, we don't need divide a number by every number less than it to see if it is divisible by them. We only need to go up to the floor of the square root of the number we're checking. So if we're checking 101, we only need to check up to sqrt(101).floor, or 10. The square root is about where the factors will start repeating. For example, factors of 100:
```
2   4   5   10   20   25  50
50  25  20  10    5    4   2
```

We also don't need to check all the numbers up to the sqare root either, we only need to check the primes, since all non prime numbers have prime factors, any number up to sqrt(possible_prime) that's not prime will surely have a prime that is less than it. For example, 100 is divisible by 10, but we don't need to check 100/10, we can do 100/2, or 100/5. If 100 is divisible by 10, it is also certainly divisible by it's prime factors, and thus not prime.

In the table construction, we can also reduce the number of loops and multiplications in half by inserting the values into a table on opposite coordinates.

## Analysis
### Table:

In order to get all products, each item in array must be multiplied by each remaining array. There are p items first time through, followed by p - 1, then p - 2 and so on, resulting in p + (p - 1) + (p - 2) + ... + 2 + 1, which is n(n+1)/2, which is essential O(p^2)

### Get first n prime numbers:
We have an ask of n prime numbers, so we search by checking if a number is prime by looping sqrt(v) times to see if that number is divisible by sqrt(v).floor, where v is the value currently being checked. It looks like O(n sqrt(v)) time, but we're not checking n values. We're actually checking an unknown k values since there is no known pattern for primes, so the best we can do is O(n(k * sqrt(v)))

### Total time:
Total time would be the combination of the time it takes to get the primes, and time it takes to create the table and print, which is O(n(k*sqrt(v)) + p^2)

### Memory and scaling:
Creating the array of primes is O(n) space, but the table is O(n^2). The method has already been optimized to call each combination of prime factors only once, but the table itself will take up about 2x that many array space. We can tweak the algorithm that writes the table to not create an 2d array at all and construct each row on the fly, but at the expense of maxing about 2x as many loops to multiply all the numbers, ie O(n^2/2 vs O(n^2), which while reduces to the same big O, may have a real impact on real life performance. In general, due to the nature 
