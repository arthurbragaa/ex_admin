defmodule ExAdmin.Theme.ActiveAdmin.Page do
  @moduledoc false
  use Xain

  def columns(cols) do
    col_count = Enum.count(cols)
    count = Kernel.div 12, col_count
    div ".columns" do
      for {{:safe, html}, inx} <- Enum.with_index(cols) do
        markup :nested do
          style = "width: #{100 / (12 / count) - 2}%;" <>
            if inx < (col_count - 1), do: " margin-right: 2%;", else: ""
          div html, class: "column", style: style
        end
        |> Phoenix.HTML.safe_to_string |> raw
      end
      div "", style: "clear:both;"
    end
  end
end
