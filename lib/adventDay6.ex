defmodule Day6 do

  # ^([a-z]* [a-z]+) (\d+,\d+) through (\d+,\d+)$
  def translate(coords) do
   [x,y]=coords
   x*1000+y
  end
  
  def turn_on(x),  do: 1
  def turn_off(x), do: 0
  def toggle(x),   do: abs(x-1)
  
  def parse(x) do
    Regex.scan( ~r/^([a-z]+|[a-z ]+) (\d+,\d+) through (\d+,\d+)$/,x) 
    |> List.flatten
    |> tl
  end
  
  def toCoords(x) do
    String.split(x,",") 
    |> Enum.map(&Integer.parse(&1))
    |> Enum.map(&elem(&1,0))
  end
  
  def runLights(x) do
  [op,from,to] = parse(x)
  end
end
