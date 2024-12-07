def read_corrupted_data(input)
  File.open(input) do |file_line|
    return file_line.read
  end
end

def process_input(input)
  input.scan(/mul\((\d{1,3}),(\d{1,3})\)|(don't\(\))|(do\(\))/).map(&:compact)
end

def calculate_product(input)
  allow_multiplication = true

  product = input.map do |row|
    if row.length == 1
      allow_multiplication = row[0] != "don't()"
      next
    end

    next if allow_multiplication == false

    row[0].to_i * row[1].to_i
  end
  product.compact
end

def calculate_sum(input)
  input.sum
end

def execute
  calculate_sum(calculate_product(process_input(read_corrupted_data('input.txt'))))
end

puts execute
