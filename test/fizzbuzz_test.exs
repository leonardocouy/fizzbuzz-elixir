defmodule FizzbuzzTest do
  use ExUnit.Case

  setup_all do
    path = "test.txt"

    File.write!(path, "1,2,3,4,5,10,15,20")
    on_exit(fn -> File.rm!(path) end)

    {:ok, file_path: path}
  end

  describe "build/1" do
    test "when a valid file is provided, returns the converted list", %{file_path: file_path} do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}

      assert Fizzbuzz.build(file_path) == expected_response
    end

    test "when invalid file is provided, returns error" do
      expected_response = {:error, "Error reading the file 'invalid.txt' enoent"}

      assert Fizzbuzz.build("invalid.txt") == expected_response
    end
  end
end
