
numloop = ARGV[0].to_i();

(0..numloop).each do |i|

 #20% in the fastest 10%, 70% in the middle, 10% in the slowest 25%, 10% tooo sloowwww 

 numMS = 10;

 if (i % 20).between?(0,4)
    numMS = rand(20);
 end

 if (i % 20).between?(5,16)
     numMS = rand(100);
 end

 if (i % 20)==17
   numMS = rand(25)+75;
 end

 if (i % 20)==18
   numMS = rand(100)+40;
 end


 if (i % 20)==19
   numMS = rand(20)+120; 
 end

 puts numMS.to_s();
end

