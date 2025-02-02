require_relative '../lib/cleanfizzbuzz_lib.rb'

require 'minitest/autorun'

class TestCleanfizzbuzz < MiniTest::Test
  def test_init 
    playing = Cleanfizzbuzz.new()
    assert(playing!=nil,"Created object")
  end

  def test_fizz
    playing = Cleanfizzbuzz.new()
    assert(playing.getFizzBuzzForOneNumber(3)=="fizz", "3 is fizz")
  end

  def test_one
    playing = Cleanfizzbuzz.new()
    assert(playing.getFizzBuzzForOneNumber(1)=="1", "one is 1")
  end

  def test_buzz
    playing = Cleanfizzbuzz.new()
    assert(playing.getFizzBuzzForOneNumber(5)=="buzz", "5 is buzz")
  end

  def test_fizzbuzz
    playing = Cleanfizzbuzz.new()
    assert(playing.getFizzBuzzForOneNumber(15)=="fizzbuzz", "15 is fizzbuzz (" + playing.getFizzBuzzForOneNumber(5) + ")")
  end

  def test_getFizz_one()
    playing = Cleanfizzbuzz.new()
    result = playing.getFizzBuzzForAGroupOneTo(1);
    assert(result=="1\n");
  end

  def test_getFizz_one_to_fifteen()
    playing = Cleanfizzbuzz.new()
    #expected="1\n"2\n"+"fizz\n"+"4\n"+"buzz\n"+"fizz\n"+"7\n"+"8\n"+"fizz\n"+"buzz\n"+"11\n"+"fizz\n"+"13\n"+"14\n"+"fizzbuzz\n"
    expected="1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz\n"
    result=playing.getFizzBuzzForAGroupOneTo(15);
    assert(result==expected, "comparing ("+expected+") to ("+result+")")
  end
  
end
