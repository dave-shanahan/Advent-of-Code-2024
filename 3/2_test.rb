require 'minitest/autorun'

require_relative '2'

describe 2 do
  describe 'when doing a memory decode' do
    before do
      @input_file = 'example2.txt'
    end

    it 'must read corrupted memory from file' do
      corrupted_data = read_corrupted_data(@input_file)
      _(corrupted_data).must_equal "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    end

    it 'processes input and store the output as 2d array' do
      output = process_input("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")
      _(output).must_equal [['2', '4'], ["don't()"], ['5', '5'], ['11', '8'], ['do()'], ['8', '5']]
    end

    it 'iterates over each element to determine the product of each' do
      input = [['2', '4'], ["don't()"], ['5', '5'], ['11', '8'], ['do()'], ['8', '5']]
      _(calculate_product(input)).must_equal [8, 40]
    end

    it 'calculates the sum of each multiplication product' do
      input = [8, 40]
      _(calculate_sum(input)).must_equal 48
    end
  end
end
