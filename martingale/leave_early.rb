
puts "-----------------------------------------------------"
puts "leave_early.rb"
puts "(C) 2021 Matthew Heusser Matt@xndev.com"
puts " "
puts "Syntax: ruby leave_early.rb (odd % as integer) (dollars start) (dollars leave with winning) (losing) (bet size)  (num games)"
puts "Example: ruby leave_early.rb 45 400 460 370 15 100"
puts "Note numbers are inclusive. As soon as we get to 460 or 370, it is time to go"
puts "-----------------------------------------------------"

odds_as_a_percentage = ARGV.shift.to_i();
dollars_to_start_with = ARGV.shift.to_i();
dollars_to_leave_with_winning = ARGV.shift.to_i();
dollars_to_leave_with_losing = ARGV.shift.to_i();
bet_size = ARGV.shift.to_i();
num_simulations = ARGV.shift.to_i();

puts odds_as_a_percentage.to_s() + " " + 
     dollars_to_start_with.to_s() + " " + 
     dollars_to_leave_with_winning.to_s() + " " + 
     dollars_to_leave_with_losing.to_s() + " " + 
     bet_size.to_s() + " " + 
     num_simulations.to_s();


running_dollars = 0;

for i in 1..num_simulations
  this_visit = dollars_to_start_with
  while (this_visit.between?(dollars_to_leave_with_losing, dollars_to_leave_with_winning))

    #Rand will be a number from 0.0 to 1.0, where odds is something like 45 or 48, /100 = .45  
    result = rand;
    #puts "random number = " + result.to_s();
    if (rand<= (odds_as_a_percentage.to_f()/100))
      this_visit = this_visit + bet_size;
    else
      this_visit = this_visit - bet_size;
    end
  end
  #puts "adjused dollars = " +  this_visit.to_s(); 
  running_dollars = running_dollars + this_visit;
end

puts "\nOver " + num_simulations.to_s() + " simulations we had " + 
      '$' + (num_simulations*dollars_to_start_with).to_s() + 
      " dollars available and left with " + running_dollars.to_s(); 




