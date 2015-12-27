defmodule Day6 do

  # ^([a-z]* [a-z]+) (\d+,\d+) through (\d+,\d+)$
  def translate(coords) do
   [x,y]=coords
   x*1000+y
  end
  
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
  
  def getLocation(x), do: toCoords(x) |> translate
  
  def runLights(x,dict) do
    IO.puts(x)
    [op,from,to] = parse(x)
    first=getLocation(from)
    last=getLocation(to)
    itemsToUpdate=first..last|> Enum.to_list
    doOperation(itemsToUpdate,op,dict)
  end
  
  def initDict(), do: initDict(0..999999|>Enum.to_list,%{})
  def initDict([],dict), do: dict
  def initDict(list,dict) do
    [head|tail]=list
    dict=Dict.update(dict,head,0,fn x -> 1 end)
    initDict(tail,dict) 
  end
  
  def doOperation([],op,dict), do: dict
  def doOperation(list,op,dict) do
    [key|tail]=list
    case op do
        "turn on"  -> dict=Dict.update(dict,key,0,fn x -> 1 end)
        "turn off" -> dict=Dict.update(dict,key,0,fn x -> 0 end)
        "toggle"   -> dict=Dict.update(dict,key,0,fn x -> abs(x-1) end)
    end
    doOperation(tail,op,dict)
  end
  
  def iterateFile([],dict), do: dict
  def iterateFile(lines,dict) do
    [head|tail]=lines
    dict=runLights(head,dict)
    iterateFile(tail,dict)
  end
  def iterateFile(lines) do
   dict=initDict()
   iterateFile(lines,dict)
  end
   
   def readLinesFromFile(), do: File.stream!("test/fixtures/day6") |> Enum.to_list
   def countLightsOn(dict), do: Dict.values(dict)|>Enum.sum #598126 too high
   def solveAdvent(),       do: readLinesFromFile |> iterateFile |> countLightsOn
end
