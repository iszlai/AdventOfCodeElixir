defmodule Day4 do

  def md5(data) do
    Base.encode16(:erlang.md5(data), case: :lower)
  end
  
  def getFirstFive(string) do
    String.slice(string,0..4) |> String.to_char_list
  end
  
  def areThereFiveZeroes(string) do
    isZero=fn x -> x== ?0 end
    Enum.filter(string, isZero) |> Enum.count == 5
  end
  
  def checkNumber(initial,number) do
    initial <> to_string(number)
    |> md5 
    |> getFirstFive
    |> areThereFiveZeroes
  end
  
  def findNumber(initial,number) do
    case checkNumber(initial,number) do
        true  -> number
        false -> findNumber(initial,number+1)
    end
  end
  
  def findNumber(initial) do
    findNumber(initial,0)
  end

  
  
end
