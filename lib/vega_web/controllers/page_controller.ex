defmodule VegaWeb.PageController do
  use VegaWeb, :controller

  alias VegaLite, as: Vl

  def home(conn, _params) do
    chart =
      Vl.new(width: 400, height: 400)

      # Specify data source for the graphic, see the data_from_* functions
      |> Vl.data_from_values(iteration: 1..100, score: 1..100)
      # |> Vl.data_from_values([%{iteration: 1, score: 1}, ...])
      # |> Vl.data_from_url("...")

      # Pick a visual mark for the graphic
      |> Vl.mark(:line)
      # |> Vl.mark(:point, tooltip: true)

      # Map data fields to visual properties of the mark, like position or shape
      |> Vl.encode_field(:x, "iteration", type: :quantitative)
      |> Vl.encode_field(:y, "score", type: :quantitative)

    render(conn, :home, layout: false, chart: chart)
  end
end
