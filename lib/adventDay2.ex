defmodule Day2  do
    
    def getSides (line) do
        list=String.split(line,"x",trim: true)
        Enum.map(list,fn x -> elem(Integer.parse(x),0) end )
      
    end
    
    def getExtra (list) do
         mins=tl(Enum.sort(list, &(&1 > &2)))
         Enum.reduce(mins, &(&1* &2))
    end
    
    def getSurface(list) do 
        [l,h,w]=list
        2*l*w + 2*w*h + 2*h*l
    end
    
    def getSheetSize(input) do
        line=getSides(input)
        getSurface(line)+getExtra(line)
    end
end