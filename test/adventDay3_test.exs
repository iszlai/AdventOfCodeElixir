defmodule Day3Test do
  use ExUnit.Case, async: true

  test "Test 1 mod" do
    assert Day3.getHowManyHouses('>') == 2
  end
  
  test "Test square" do
    assert Day3.getHowManyHouses('^>v<') == 4
  end

  test "Test updown" do
    assert Day3.getHowManyHouses('^v^v^v^v^v') == 2
  end
  
  test "input" do
  case File.read("test/fixtures/day3") do
    {:ok, body}      -> assert Day3.getHowManyHouses(to_char_list(body)) == 2081 
    {:error, reason} -> IO.puts(reason)
    end   
  end

end
