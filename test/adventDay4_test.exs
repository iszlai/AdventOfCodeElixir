defmodule Day4Test do
  use ExUnit.Case, async: true


  test "Test MD5" do
    assert Day4.md5('abcdef609043') == "000001dbbfa3a5c83a2d506429c7b00e"
  end
  
  test "Test checkNumber" do
    assert Day4.checkNumber("abcdef", 609043) == true
  end
  
  test "Test findNumber" do
    #assert Day4.findNumber("abcdef") == 609043
  end

  test "Test findNumber other" do
    #assert Day4.findNumber("pqrstuv") == 1048970
  end  

  test "Test findNumber myInput" do
    #assert Day4.findNumber("ckczppom") == 117946
  end  
end
