
require_relative '../lib/cursor_wrap.rb'

cursor = Cursor_Wrap.new();
puts "hello, world!\n\n\n";
sleep(1);
cursor.moveup(3);
puts "Goodbye, cruel world\n\n\n";
