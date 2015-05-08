
class Game
  attr :frames;

  def initialize(pinsRolled)
    @frames = pinsRolled
  end

  def result
    score = calcscore()
    return score
  end

  def calcscore
    return 0
  end

end

pins = Array.new(10) { |e| e = 1 };
puts "#{pins}";
playing = Game.new(pins);
 
