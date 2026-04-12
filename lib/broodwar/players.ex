defmodule Broodwar.Players do
  import Ecto.Query
  alias Broodwar.Repo
  alias Broodwar.Players.Player

  def list_players(opts \\ []) do
    Player
    |> order_by(desc: :rating)
    |> maybe_filter_race(opts[:race])
    |> Repo.all()
  end

  def get_player!(id), do: Repo.get!(Player, id)

  def get_player_matches(player_id) do
    alias Broodwar.Matches.Match

    Match
    |> where([m], m.player_a_id == ^player_id or m.player_b_id == ^player_id)
    |> order_by(desc: :played_at)
    |> preload([:tournament, :player_a, :player_b, :map])
    |> Repo.all()
  end

  defp maybe_filter_race(query, nil), do: query
  defp maybe_filter_race(query, race), do: where(query, [p], p.race == ^race)
end
