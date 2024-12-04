safe_reports = 0

def valid_sort?(report)
  if report[0] < report[1]
    report.each_index do |i|
      puts "Index: #{i}"
      if i != report.length - 1
        if (report[i] == report[i+1])
          next
        end
        if (report[i] > report[i+1])
          return false
        end
      end
    end
    true
  end

  report.each_index do |i|
    puts "Index: #{i}"
    if i != report.length - 1
      if (report[i] == report[i+1])
        next
      end
      if (report[i] < report[i+1])
        return false
      end
    end
  end
  true
end

# def valid_sort?(report)
#   sorts = [report.sort { |a, b| a <=> b }, report.sort { |a, b| b <=> a }]
#   true if sorts.include?(report)
# end

def contains_valid_levels?(report)
  report.each_index do |index|
    if index != 0
      prior_difference = (report[index] - report[index-1]).abs
      return false unless within_permitted_range?(prior_difference)
    end

    if index != report.length - 1
      post_difference = (report[index] - report[index+1]).abs
      return false unless within_permitted_range?(post_difference)
    end
  end
  true
end

def within_permitted_range?(difference)
  (difference > 0) && (difference <= 3)
end

File.foreach('example_input.txt') do |line|
  report = line.split.map(&:to_i)

  puts "Report: #{report}"
  puts "Report length: #{report.length}"
  puts "Report valid? #{valid_sort?(report)}"
  
  # if valid_sort?(report) && contains_valid_levels?(report)
  #   safe_reports += 1
  # end

end

puts "Safe Reports: #{safe_reports}"