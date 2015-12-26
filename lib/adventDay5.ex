defmodule Day5 do
  
  def containsTreeVowels (string) do
    isVowel= fn x -> x ==?a or x ==?e or x == ?i or x==?o or x==?u end
    Enum.filter(string,isVowel) |> Enum.count >= 3
  end
  
  defp repeatedChar(x,y,[]) do
    x == y
  end
  
  defp repeatedChar(x,y,res) do
    case x == y do
        false -> repeatedChar(y,hd(res),tl(res))
        _  -> true
    end
  end
  
  def containsRepeatedChar(string) do
    [x,y|res] = string
    repeatedChar(x,y,res)
  end
  
  def containsBadSillabs(string) do
    String.contains?(to_string(string), ["ab", "cd", "pq", "xy"]) == false
  end
  
  def isNiceString(string) do
    string=to_char_list(string)
    containsTreeVowels(string) and containsRepeatedChar(string) and containsBadSillabs(string)
  end

end
