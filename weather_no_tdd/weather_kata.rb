

#An implementation of the weather kata
#http://codekata.com/kata/kata04-data-munging/
#By Matt Heusser
#

def slice_line(line_text)
  #Remove special char because annoying
  line_text.gsub!(/\*/, '');  
  (day, high_temp, low_temp) = line_text.gsub(/\s+/m, ' ').strip.split(" ");
  diff = high_temp.to_i()-low_temp.to_i();
  return day,diff,low_temp,high_temp;
end

#Put file into an array
lines = []

highest = 0;
best_day = 0;
best_high_temp = 0;
best_low_temp = 0;
f = File.open('weather.txt') or die;
f.each_line { |line|
  #Split function here find day and current_diff
  
 (current_day, current_diff, current_low_temp, current_high_temp) = slice_line(line);


  if current_diff > highest
    highest = current_diff;
    best_day = current_day;
    best_low_temp = current_low_temp;
    best_high_tep = current_high_temp;
  end
}


puts best_day.to_s() + " " + highest.to_s() + " " +  best_low_temp.to_s() + " " + best_high_temp.to_s();

