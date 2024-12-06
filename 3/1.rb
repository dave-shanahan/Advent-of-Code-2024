def read_corrupted_data(input)
  File.open(input) do |file_line|
    return file_line.read
  end
end

def process_input(input)
  matches = input.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
  matches.map { |x, y| [x.to_i, y.to_i] }
end

def calculate_product(input)
  input.map { |row| row[0] * row[1] }
end

def calculate_sum(input)
  input.sum
end

def execute
  calculate_sum(calculate_product(process_input(read_corrupted_data('input.txt'))))
end

puts execute
