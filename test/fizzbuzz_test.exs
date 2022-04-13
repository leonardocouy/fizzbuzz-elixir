defmodule FizzbuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}

      assert Fizzbuzz.build("numbers.txt") == expected_response
    end

    test "when invalid file is provided, returns error" do
      expected_response = {:error, "Error reading the file 'invalid.txt' enoent"}

      assert Fizzbuzz.build("invalid.txt") == expected_response
    end
  end
end
