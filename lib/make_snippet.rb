def make_snippet(str)
  arr = str.split(" ")
  if arr.length > 5
    return arr[0,5].join(" ") + "..."
  elsif arr.length <= 5
    return arr.join(" ")
  end
end 