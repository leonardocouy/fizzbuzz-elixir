defmodule Fizzbuzz do
  def build(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  def handle_file({:ok, content}), do: String.trim(content)
  def handle_file({:error, reason}), do: reason
end
