defmodule Day1 do

def santaFloor (list) do
    calcFloor(list,0)
end

defp calcFloor(list,floor) do
   case list do
   [] -> floor
   [h|rest]->     case h do
                        40 ->  calcFloor(rest,floor+1)
                        41 ->  calcFloor(rest,floor-1)
                    end
   end
   

    end
    

end
