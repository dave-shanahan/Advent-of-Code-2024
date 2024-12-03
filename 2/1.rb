safe_reports = 0

def check_sort(report)
  sorts = [report.sort { |a, b| a <=> b }, report.sort { |a, b| b <=> a }]

  true if sorts.include?(report)
end

def check_levels(report)
  report.each_index do |index|
    # puts "Level: #{report[index]}, Index: #{index}"
    puts "Level: #{report[index].class}"
    # break if index == 2
  end
end

File.foreach('example_input.txt') do |line|
  report = line.split.map(&:to_i)

  # a.sort {|a, b| a <=> b } ==

  puts "Report: #{report}"

  # if check_sort(report)

  # end

  check_levels(report)
end
