
class KataGenerator
  attr :basefilename
  attr :libdir
  attr :testdir
  attr :katafirstupper
  attr :libfile

  def initialize(kataname)
    @basefilename = kataname
    @libdir = "./"+@basefilename+"/lib"
    @testdir = "./"+@basefilename+"/test"
    @katafirstupper = @basefilename.slice(0,1).capitalize + @basefilename.slice(1..-1)
    @libfile = kataname + "_lib.rb"
  end

  def setup()
	createDirectories()
    makeBaseFile()
    makeLibFile()
    makeTestFile()
  end	  

  def createDirectories()
    Dir.mkdir("./"+@basefilename)
    Dir.mkdir("./"+@libdir)
    Dir.mkdir("./"+@testdir)
  end

  def writefile(filename, texttowrite)
    begin
      file = File.open(filename, 'w')        
      file.write(texttowrite)
    rescue IOError => e
      return false
    ensure
      file.close unless file == nil
      return true 
    end
  end

  def makeBaseFile()
    filename = "./"+@basefilename+"/"+@basefilename+".rb"
    text = "#" + @basefilename+".rb\n\nrequire_relative 'lib/"+@libfile+"'\n"
    text+=@basefilename+"="+ @katafirstupper+".new()\n\n"
    return writefile(filename, text)
  end

  def makeTestFile()
     filename = @testdir+"/"+@basefilename+"_test.rb"
     text= "require_relative "+ "'../lib/" + @libfile + "'\n\n"
     text+="require 'minitest/autorun'\n\n"
     text+="class Test" + @katafirstupper + " < MiniTest::Test\n"
     text+="  def test_init \n"
     text+="    playing = "+@katafirstupper+".new()\n"
     text+="    assert(playing!=nil,\"Created object\")\n"
     text+="  end\n\n"
     text+="end"
     return writefile(filename, text)
  end

  def makeLibFile()
    filename = @libdir+"/"+@libfile
    text = "\n\nclass "+@katafirstupper+"\n\n  def initialize()\n\n  end\n"
    text+="end\n\n\n"
    return writefile(filename, text) 
  end

end

directory = ARGV[0]
puts "\nKataGenerator\nBy Matthew Heusser Matt@xndev.com\n----------------------------------\n"
if directory==nil || directory.class!=String || directory.length==0
  puts " Param1: Directory to create and rb files to make. "
  puts " Assumes the directory will be ./ and cannot be blank.\n\n"
else
  Kata = KataGenerator.new(directory)
  Kata.setup()
end

