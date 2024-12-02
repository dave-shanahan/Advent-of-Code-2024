# File read
# split by space into two lists
# order 1st list ascending
# order 2nd list descending
# Loop length
# if list1 > list2
#   list1[i] - list2[i]
#   add to sum
# else
#   list2[i] - list1[i]
#   add to sum
# end

list_one = []
list_two = []
total_distance = 0

File.foreach("input.txt") do |line|
  l1, l2 = line.split
  list_one.push(l1.to_i)
  list_two.push(l2.to_i)
end

list_one = list_one.sort
list_two = list_two.sort

if (list_one.length == list_two.length)
  list_one.each_index do |index|
    distance = 0
    if list_one[index] >= list_two[index]
      difference = list_one[index] - list_two[index]
    else
      difference = list_two[index] - list_one[index]
    end
    total_distance = total_distance + difference
  end
end

puts "Total distance: #{total_distance}"
