
multiplier = 2;
original_bet = 10;
current_bet = original_bet;

odds = 0.48;

result = rand(odds);
num_true = 0;
num_false = 0;
num_runs = 100;
bankroll = 0;
updates_every = 10;
winner = "";
max_bet = original_bet;

for i in 0..num_runs

  if (current_bet > max_bet) 
    max_bet = current_bet;
  end

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
    puts i.to_s() + ") " + winner + " bet: " + current_bet.to_s() + " bankroll: " + bankroll.to_s();
  end

end

puts "\n\n max bet: " + max_bet.to_s()  + "\n\n";



