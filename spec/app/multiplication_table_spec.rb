require "./app/multiplication_table"

describe Multiplication_Table, "on init" do

  it "builds a 2d array of size items_array.length + 1" do
    input_array_size = 12
    input_array = Array.new(input_array_size, 0)
    table = Multiplication_Table.new(input_array).mult_table

    expect(table.length).to be(input_array_size + 1)
    expect(table[0].length).to be(input_array_size + 1)
  end

  it "multiplies the elements in the input array" do
    input_array_size = 3
    value_of_input = 2
    input_array = Array.new(input_array_size, value_of_input)
    table = Multiplication_Table.new(input_array).mult_table

    i = 0
    while i < input_array_size
      j = 0
      while j < input_array_size
        expect(table[i+1][j+1]).to be(value_of_input ** 2)
        j += 1
      end
      i += 1
    end
  end
end
