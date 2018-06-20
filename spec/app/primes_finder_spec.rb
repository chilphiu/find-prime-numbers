require "./app/primes_finder"

describe Primes_Finder, "on init" do

  it "creates an array of 10 primes by default" do
    primes_array = Primes_Finder.new.primes_array
    expect(primes_array.length).to be(10)
  end

  it "creates an array of specified number of primes" do
    primes_array = Primes_Finder.new(11).primes_array
    expect(primes_array.length).to be(11)
  end

  describe "when getting the next number" do
    it "only gets odd numbers when input is greater than 5" do
      primes_finder = Primes_Finder.new
      next_number = primes_finder.next_number_to_check(6)
      expect(next_number).to be(7)
    end
  end

end
