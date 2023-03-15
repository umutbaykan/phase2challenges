def check_for_todo(str)
  fail "Invalid input type, please check." unless str.is_a? String
  fail "No input." if str == ""
  return str.split(" ").include? '#TODO'
end