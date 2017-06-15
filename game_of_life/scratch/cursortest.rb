
require 'curses'

Curses.init_screen

    Curses.setpos(1,1);
    puts "hello world";
    sleep(1);
    Curses.setpos(1,1);
    puts "Goodby cruel world";
