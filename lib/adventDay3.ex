defmodule Day3  do
    
   
   
   iex(1)> x=%{{0,0}=> 1}
%{{0, 0} => 1}
iex(2)> x
%{{0, 0} => 1}
iex(3)> Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(4)> Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(5)> Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(6)> Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(7)> Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(8)> x=Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 2}
iex(9)> x=Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 3}
iex(10)> x=Dict.update!(x,{0,0},fn x -> x+1 end)
%{{0, 0} => 4}
iex(11)>



end