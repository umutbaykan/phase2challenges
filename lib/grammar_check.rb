def grammar_check(str)
  fail "Input not valid." unless str.is_a? String
  fail "No input detected." if str == ""
  return false if str[0] == str[0].downcase
  return false if str[-1] != "."
  return true
end