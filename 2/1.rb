safe_reports = 0

def sorted_correctly?(ascending, current, post)
  return current < post if ascending

  current > post
end

def safe_report?(report)
  ascending = report[0] < report[1]

  report.each_index do |index|
    next if index == report.length - 1

    current = report[index]
    post = report[index + 1]

    return false unless sorted_correctly?(ascending, current, post)

    q = (current - post).abs
    return false unless within_permitted_range?(q)

    next unless index != 0

    prior = report[index - 1]
    p = (current - prior).abs
    return false unless within_permitted_range?(p)
  end
  true
end

def within_permitted_range?(difference)
  (difference > 0) && (difference <= 3)
end

File.foreach('input.txt') do |line|
  report = line.split.map(&:to_i)
  safe_reports += 1 if safe_report?(report)
end

puts "Safe Reports: #{safe_reports}"
