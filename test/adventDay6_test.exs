defmodule Day6Test do
  use ExUnit.Case, async: true

  test "Test all lights" do
    assert Day6.iterateFile(["turn on 0,0 through 999,999"]) |> Day6.countLightsOn == 1000000
  end
  
  test "Test first line of lights" do
    assert Day6.iterateFile(["toggle 0,0 through 999,0"]) |> Day6.countLightsOn == 1000
  end
  
  
end
