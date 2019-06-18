#Simplest possible implementation of clifford



def clifford(values)
  (var1, operator, var2) = values.split(/\s/);
  
 
  operator = operator.gsub(/2/,'*');
  operator = operator.gsub(/1/,'+');


  result = 0;

  command = "result = " + var1.to_s() + operator.to_s() + var2.to_s();
  eval(command);
  return result;
end

result = clifford("1 2 3");
puts result.to_s() + "\n";
result = clifford("5 1 6");
puts result.to_s() + "\n";

#Two ways I could do this
#Is either transform the middle number into a / or + and interpolate it
#OR switch or brute force
#Trying brute force first because YAGNI

#Also trying non-TDD first 
#And not-handling exceptions first
#So that gives me 4 different ways to do the kata
#Plus from the command-line, from file etc


