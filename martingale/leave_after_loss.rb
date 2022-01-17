
puts "-----------------------------------------------------"
puts "leave_after_loss.rb"
puts "(C) 2021 Matthew Heusser Matt@xndev.com"
puts " "
puts "Syntax: ruby leave_after_loss.rb (odd % as integer) (dollars start) (dollars leave with winning) (losing) (largest loss) (bet size)  (num games)"
puts "Example: ruby leave_after_loss.rb 45 400 460 370 64 15 100"
puts "Note numbers are inclusive. As soon as we get to 460 or 370, it is time to go"
puts "-----------------------------------------------------"

odds_as_a_percentage = ARGV.shift.to_i();
dollars_to_start_with = ARGV.shift.to_i();
dollars_to_leave_with_winning = ARGV.shift.to_i();
dollars_to_leave_with_losing = ARGV.shift.to_i();
largest_loss = ARGV.shift.to_i();
initial_bet_size = ARGV.shift.to_i();
num_simulations = ARGV.shift.to_i();

puts odds_as_a_percentage.to_s() + " " + 
     dollars_to_start_with.to_s() + " " + 
     dollars_to_leave_with_winning.to_s() + " " + 
     dollars_to_leave_with_losing.to_s() + " " + 
     largest_loss.to_s() + " " +
     initial_bet_size.to_s() + " " + 
     num_simulations.to_s();


running_dollars = 0;
bet_size = initial_bet_size;

for i in 1..num_simulations
  this_visit = dollars_to_start_with
  while (this_visit.between?(dollars_to_leave_with_losing, dollars_to_leave_with_winning) && (bet_size< largest_loss * 2) )

    #Rand will be a number from 0.0 to 1.0, where odds is something like 45 or 48, /100 = .45  
    result = rand;
    #puts "random number = " + result.to_s();
    if (rand<= (odds_as_a_percentage.to_f()/100))
      this_visit = this_visit + bet_size;
      bet_size = initial_bet_size;
    else
      this_visit = this_visit - bet_size;
      bet_size=bet_size*2;
    end
    puts "adjused dollars = " +  this_visit.to_s();
  end
  bet_size = initial_bet_size;
  puts "Ending run " + i.to_s() + " adjused dollars = " +  this_visit.to_s(); 
  running_dollars = running_dollars + this_visit;
end

puts "\nOver " + num_simulations.to_s() + " simulations we had " + 
      '$' + (num_simulations*dollars_to_start_with).to_s() + 
      " dollars available and left with " + running_dollars.to_s(); 




