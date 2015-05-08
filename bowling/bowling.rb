
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
    total = 0
    frames.each do |roll|
      total+=roll
    end
    return total
  end

end

pins = Array.new(10) { |e| e = 1 };
puts "#{pins}";
playing = Game.new(pins);
score = playing.result();
puts "Total score is: " + score.to_s();
