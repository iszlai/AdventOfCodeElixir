defmodule Day3  do

    defp getStep(location,modifier) do 
        {x,y} = location
        case modifier do
            ?^ -> {x,y+1} 
            ?> -> {x+1,y}
            ?v -> {x,y-1}
            ?< -> {x-1,y}
        end
    end
    
    defp updateState(grid,location,modifier) do
        newLoc=getStep(location,modifier) 
        grid=Dict.update(grid,newLoc,1,fn x -> x+1 end )
        {grid,newLoc}
    end
    
    defp iterateHouses(grid,location,modifiers) do
        case modifiers do
            [head|rest] ->
                            {grid,newLoc}=updateState(grid,location,head)
                            iterateHouses(grid,newLoc,rest)
            []          ->   grid                 
        end
    end
    
    defp santaRun(modifiers) do 
        iterateHouses(%{{0,0}=>1},{0,0},modifiers)
    end
    
    def getHowManyHouses(modifiers) do
        santaRun(modifiers) 
            |> Dict.keys 
            |> length
    end
end