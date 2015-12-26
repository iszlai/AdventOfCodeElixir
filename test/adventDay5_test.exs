defmodule Day5Test do
  use ExUnit.Case, async: true


  test "Test Simple nice" do
    assert Day5.isNiceString('ugknbfddgicrmopn') == true
  end

  test "Test overlap" do
    assert Day5.isNiceString('aaa') == true
  end

  test "Test noDouble" do
    assert Day5.isNiceString('jchzalrnumimnmhp') == false
  end
  
  test "Test bad" do
    assert Day5.isNiceString('haegwjzuvuyypxyu') == false
  end

  test "Test vowels" do
    assert Day5.isNiceString('dvszwmarrgswjxmb') == false
  end
  
  test "How many correct" do
        assert File.stream!("test/fixtures/day5")
        |>Enum.to_list
        |>Enum.map(&Day5.isNiceString(&1))
        |>Enum.filter(&(&1))
        |>length == 236
  end

end
