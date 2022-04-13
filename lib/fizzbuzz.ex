defmodule Fizzbuzz do
  def build(filename) do
    filename
    |> File.read()
    |> handle_file(filename)
  end

  defp handle_file({:ok, content}, _filename) do
    content =
      content
      |> String.trim
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, content}
  end

  defp handle_file({:error, reason}, filename), do: "Error reading the file '#{filename}' #{reason}"

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer
    |> evaluate_Number
  end

  defp evaluate_Number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_Number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_Number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_Number(number), do: number
end
