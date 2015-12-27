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
    toUpdate=getIndex(first,last)
    doOperation(toUpdate,op,dict)
  end
  
  def initDict() do
   for x <- 0..999, y <- 0..999, into: %{} do
    {{x,y}, 0}
   end
  end
  
  def getIndex(first, last) do
    [xstart,ystart]=first
    [xend,yend]=last
    for x <- xstart..xend,
        y <- ystart..yend do
        {x,y}
        end
  end
  
  def doOperation([],op,dict), do: dict
  def doOperation(index,op,dict) do
        [head|tail]=index
        case op do
            "turn on"  -> dict=Dict.update(dict,head,0,fn x -> 1 end)
            "turn off" -> dict=Dict.update(dict,head,0,fn x -> 0 end)
            "toggle"   -> dict=Dict.update(dict,head,0,fn x -> abs(x-1) end)
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
