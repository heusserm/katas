
class Game
  #frames is an array of arrays.
  attr :frames;

  def roll(pin1, pin2)
    frame = [pin1, pin2]
    frames.push(frame);
  end

  def initialize()
    @frames = Array.new();
  end

  def result
    score = calcscore()
    return score
  end

  def calcscore
    total = 0
    frames.each do |frame|
      frame.each do |roll|
        total+=roll
      end
    end
    return total
  end

end

playing = Game.new();
playing.roll(1,1);
playing.roll(1,1);
playing.roll(1,1);
playing.roll(1,1);
score = playing.result();
puts "Total score is: " + score.to_s();
