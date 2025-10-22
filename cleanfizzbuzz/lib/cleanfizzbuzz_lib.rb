

class Cleanfizzbuzz

  def initialize()

  end

  def getFizzBuzzForN(n)    
    name = ""
    if (n % 3 == 0)
      name = "fizz"
    end

    if (n % 5 ==0 )
      name=name+"buzz"
    end 
    
    if (name == "")
      name = n.to_s()
    end 

    return name;
  end

  def getFizzBuzzForAGroupOneTo(max)
    result = ""
    for n in 1..max do
      result = result+getFizzBuzzForN(n) + "\n"
    end
    return result; 
  end

end


