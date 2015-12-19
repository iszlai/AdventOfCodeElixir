defmodule Day2Test do
  use ExUnit.Case

  test "Test simple" do
    assert Day2.getSheetSize("2x3x4") == 58
  end
  
  test "Test same" do
    assert Day2.getSheetSize("1x1x10") == 43
  end
  
  test "To submit" do
  assert  File.stream!("test/fixtures/day2") 
        |> Enum.to_list
        |> Stream.map(fn x -> Day2.getSheetSize(x) end ) 
        |> Enum.sum  == 1598415
  end
  

  

end
