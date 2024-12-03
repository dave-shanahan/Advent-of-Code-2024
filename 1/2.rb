list_one = []
list_two = []
similarity_score = 0

File.foreach('input.txt') do |line|
  l1, l2 = line.split
  list_one.push(l1.to_i)
  list_two.push(l2.to_i)
end

if list_one.length == list_two.length
  list_one.each_index do |index|
    num = list_one[index]
    frequency = list_two.count(list_one[index])
    similarity_score += num * frequency
  end
end

puts "Similarity Score: #{similarity_score}"
