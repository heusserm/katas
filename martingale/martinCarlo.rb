puts "\n--------------------------------------------------------------------------"
puts "martinCarlo.rb"
puts "(C) 2021 Matthew Heusser Matt@xndev.com"
puts "----------------------------------------------------------------------------"
puts "A Monte Carol simulator of the Martingale bettering technique."
puts "Using percentage rdds of winning over time and betsize to"
puts "produce high, low, mean, average top bet amounts"
puts "Syntax: ruby martingale.rb (original bet) (num runs per session) (num sessions) (odd % as integer)"
puts "Example: ruby martinCarlo.rb 2 100 10 49"
puts "----------------------------------------------------------------------------"
puts "\n"


$original_bet = ARGV.shift.to_i();
num_bets_per_session = ARGV.shift.to_i();
num_sessions = ARGV.shift.to_i();
$odds = (ARGV.shift.to_i()).to_f()/100;
current_bet = $original_bet;

result = rand($odds);
num_true = 0;
num_false = 0;
bankroll = 0;
$updates_every = 100;
winner = "";


max_bet = $original_bet;



def run_hand(current_bet, bankroll,largest_bet_so_far, iteration_num) 
   if (current_bet > largest_bet_so_far)
     largest_bet_so_far = current_bet;
   end

  bet_made_before_corrections = current_bet;
  if (rand <= $odds)
    bankroll=bankroll+current_bet;
    current_bet = $original_bet;
    winner = "winner";
  else
    bankroll=bankroll-current_bet;
    current_bet = current_bet*2;
    winner = "loser ";
  end

  #if (iteration_num % $updates_every==0)
  #  puts (iteration_num.to_s() + ") ").ljust(10) + winner + "\t bet: " +
  #       bet_made_before_corrections.to_s().rjust(10) + " bankroll: " + bankroll.to_s().rjust(10);
  #end

  return current_bet,bankroll,largest_bet_so_far;
end

def mode(array)
    array.group_by{ |e| e }.group_by{ |k, v| v.size }.max.pop.map{ |e| e.shift }
end



def average_as_money(array)
  result = array.instance_eval { reduce(:+) / size.to_f };
  dollars = sprintf('%02.f',result)
  cents = sprintf('%.2f',result)
  return cents
end

# Run sessions
max_bets = [];
bankrolls = [];
for sessions in 0..num_sessions
  for i in 0..num_bets_per_session
    current_bet,bankroll, max_bet = run_hand(current_bet, bankroll, max_bet,i) 
  end
  #puts "\n\n max bet: " + max_bet.to_s()  + "\n\n";
  max_bets.push(max_bet);
  bankrolls.push(bankroll);
  max_bet = $original_bet;
  bankroll = 0;
end


#Calc Metrics
#---------------------------------------------------------------------
average_max = average_as_money(max_bets);
highest_max = max_bets.max();
lowest_max = max_bets.min(); 
mode_max = mode(max_bets);


average_bankroll = average_as_money(bankrolls);
highest_bankroll = bankrolls.max();
lowest_bankroll = bankrolls.min();
mode_bankroll = mode(bankrolls);
total_bankroll = bankrolls.inject(0){|sum,x| sum + x }


#Print Results
#---------------------------------------------------------------------

puts "\n\n"
puts "----------------------------------------------------------------------------";
puts "Results:"
puts "----------------------------------------------------------------------------";
puts "After " + num_sessions.to_s() + " sessions of " + num_bets_per_session.to_s() + " hands per session ..."
puts "\n"
puts "Average Max Bet: " + average_max.to_s().rjust(12);
puts "Highest Max Bet: " + highest_max.to_s().rjust(12);
puts "Lowest Max Bet:  " + lowest_max.to_s().rjust(12);
puts "Mode Max Bet:    " + mode_max.to_s().rjust(12);
puts "\n"
puts "Average Bankroll " + average_bankroll.to_s().rjust(12);
puts "Highest Bankroll " + highest_bankroll.to_s().rjust(12);
puts "Lowest Bankroll  " + lowest_bankroll.to_s().rjust(12);
puts "Mode Bankroll    " + mode_bankroll.to_s().rjust(12);
puts "Total Bankroll   " + total_bankroll.to_s().rjust(12)



