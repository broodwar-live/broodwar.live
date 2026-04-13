defmodule Broodwar.Players do
  import Ecto.Query
  alias Broodwar.Repo
  alias Broodwar.Players.Player

  def list_players(opts \\ []) do
    Player
    |> order_by(desc: :rating)
    |> maybe_filter_race(opts[:race])
    |> maybe_filter_status(opts[:status])
    |> maybe_search(opts[:search])
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

  defp maybe_filter_status(query, nil), do: query
  defp maybe_filter_status(query, status), do: where(query, [p], p.status == ^status)

  defp maybe_search(query, nil), do: query
  defp maybe_search(query, ""), do: query

  defp maybe_search(query, search) do
    term = "%#{search}%"

    where(
      query,
      [p],
      like(p.name, ^term) or like(p.real_name, ^term) or like(p.real_name_ko, ^term)
    )
  end
end
