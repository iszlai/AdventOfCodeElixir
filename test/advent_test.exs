defmodule Day1Test do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end
  
  test "floor 0" do
    assert Day1.santaFloor('(())') == 0
    assert Day1.santaFloor('()()') == 0
  end
  
  test "floor 3" do
    assert Day1.santaFloor('(((') == 3
    assert Day1.santaFloor('(()(()(') == 3
    assert Day1.santaFloor('))(((((') == 3
  end
  
  test "floor -1" do
    assert Day1.santaFloor('())') == -1
    assert Day1.santaFloor('))(') == -1
  end
  
  test "floor -3" do
    assert Day1.santaFloor(')))') == -3
    assert Day1.santaFloor(')())())') == -3
  end
  
  test "input" do
  case File.read("test/fixtures/day1") do
    {:ok, body}      -> assert Day1.santaFloor(to_char_list(body)) == 74 
    {:error, reason} -> IO.puts(reason)
    end   
  end
  

end
