puts "-----------------------------------------------------"
puts "martingale.rb"
puts "(C) 2021 Matthew Heusser Matt@xndev.com"
puts " "
puts "Syntax: ruby martingale.rb (multiplier) (original bet) (num runs) (odd % as integer)"
puts "Example: ruby martingale.rb 2 15 10 49"
puts "-----------------------------------------------------"



multiplier = ARGV.shift.to_i();
original_bet = ARGV.shift.to_i();
num_runs = ARGV.shift.to_i();
odds = (ARGV.shift.to_i()).to_f()/100;
current_bet = original_bet;

result = rand(odds);
num_true = 0;
num_false = 0;
bankroll = 0;
updates_every = 10;
winner = "";
max_bet = original_bet;

for i in 0..num_runs

  
  if (current_bet > max_bet) 
    max_bet = current_bet;
  end

  bet_made_before_corrections = current_bet;
  if (rand <= odds) 
    bankroll=bankroll+current_bet;
    current_bet = original_bet;
    winner = "winner ";
  else
    bankroll=bankroll-current_bet;
    current_bet = (current_bet * multiplier).round();
    winner = "loser ";
  end
  
  if (i % updates_every) 
    puts i.to_s() + ") " + winner + "\t bet: " + 
         bet_made_before_corrections.to_s().rjust(10) + " bankroll: " + bankroll.to_s().rjust(10);
  end

end

puts "\n\n max bet: " + max_bet.to_s()  + "\n\n";



