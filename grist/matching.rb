
val = "GET /test HTTP/1.1"
match_data = /\/(.*)HTTP/.match(val)
result  = match_data.captures[0]
puts result

