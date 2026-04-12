defmodule BroodwarWeb.TournamentController do
  use BroodwarWeb, :controller

  alias Broodwar.Tournaments.Data

  def index(conn, _params) do
    render(conn, :index,
      active_series: Data.active_series(),
      retired_series: Data.retired_series(),
      live_seasons: Data.live_seasons(),
      champion_counts: Data.champion_counts()
    )
  end

  def show(conn, %{"slug" => slug}) do
    case Data.series(slug) do
      nil ->
        conn |> put_status(:not_found) |> put_view(BroodwarWeb.ErrorHTML) |> render(:"404")

      series ->
        render(conn, :show, series: series)
    end
  end
end
