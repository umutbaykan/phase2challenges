def time_estimator(str)
  fail "Input not valid." unless str.is_a? String
  extra_s = "s"
  minutes = str.split(" ").length / 200
  extra_s = "" if minutes == 1
  return "#{minutes} minute#{extra_s}"  
end