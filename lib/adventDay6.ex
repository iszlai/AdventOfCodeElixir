defmodule Day6 do

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
  
  def runLights(x,dict) do
    [op,from,to] = parse(x)
    first=toCoords(from)
    last=toCoords(to)
    IO.puts(inspect dict)
    a=doOperation(first,last,op,dict)
    IO.puts(inspect a)
    a
  end
  
  def initDict() do
   for x <- 0..999, y <- 0..999, into: %{} do: {{x,y}, 0}
  end
  def doOperation(first,last,op,dict) do
   [xstart,ystart]=first
   [xend,yend]=last
        IO.puts("doop")
        IO.puts(inspect dict)
    for x <- xstart..xend,
        y <- ystart..yend do
        #IO.puts("-------------------doop------------------")
        #IO.puts(inspect dict)
        case op do
            "turn on"  -> dict=Dict.update(dict,{x,y},0,fn x -> 1 end)
            "turn off" -> dict=Dict.update(dict,{x,y},0,fn x -> 0 end)
            "toggle"   -> dict=Dict.update(dict,{x,y},0,fn x -> abs(x-1) end)
        end
    end
    dict
  end
  
  def iterateFile([],dict), do: dict
  def iterateFile(lines,dict) do
    [head|tail]=lines
    dict=runLights(head,dict)
    iterateFile(tail,dict)
  end
  def iterateFile(lines) do
   dict=initDict()
   IO.puts("iterateFile")
   IO.puts(inspect dict)
   iterateFile(lines,dict)
  end
   
   def readLinesFromFile(), do: File.stream!("test/fixtures/day6") |> Enum.to_list
   def countLightsOn(dict), do: Dict.values(dict)|>Enum.sum #598126 too high
   def solveAdvent(),       do: readLinesFromFile |> iterateFile |> countLightsOn
end
