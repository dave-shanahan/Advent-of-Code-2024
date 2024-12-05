safe_reports = 0

def sorted_correctly?(ascending, current, post)
  return current < post if ascending

  current > post
end

# 8 6 4 4 1

def safe_report?(report)
  ascending = report[0] < report[1]
  bad_level_counter = 0

  report.each_index do |index|
    next if index == report.length - 1

    current = report[index]
    post = report[index + 1]

    next if current == post

    unless sorted_correctly?(ascending, current, post)
      return false unless bad_level_counter.zero?

      bad_level_counter += 1
      next

    end

    q = (current - post).abs

    unless within_permitted_range?(q)
      return false unless bad_level_counter.zero?

      bad_level_counter += 1
      next

    end

    next unless index != 0

    prior = report[index - 1]

    next if current == prior

    p = (current - prior).abs

    next if within_permitted_range?(p)

    return false unless bad_level_counter.zero?

    bad_level_counter += 1
    next
  end
  true unless bad_level_counter > 1
end

def within_permitted_range?(difference)
  (difference > 0) && (difference <= 3)
end

File.foreach('example_input.txt') do |line|
  report = line.split.map(&:to_i)
  puts "Report: #{report}"
  safe_reports += 1 if safe_report?(report)
end

puts "Safe Reports: #{safe_reports}"
