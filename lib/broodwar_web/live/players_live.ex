defmodule BroodwarWeb.PlayersLive do
  use BroodwarWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    players = Broodwar.Players.list_players()

    {:ok,
     socket
     |> assign(:page_title, "Players")
     |> assign(:players, players)
     |> assign(:race_filter, nil)}
  end

  @impl true
  def handle_event("filter_race", %{"race" => race}, socket) do
    race = if race == "", do: nil, else: race
    players = Broodwar.Players.list_players(race: race)
    {:noreply, assign(socket, players: players, race_filter: race)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h1 class="text-2xl font-bold">Players</h1>
            <p class="text-sm text-base-content/50">{length(@players)} players ranked by rating</p>
          </div>

          <div class="flex gap-1">
            <button phx-click="filter_race" phx-value-race="" class={["btn btn-sm", !@race_filter && "btn-primary" || "btn-ghost"]}>All</button>
            <button phx-click="filter_race" phx-value-race="T" class={["btn btn-sm", @race_filter == "T" && "btn-primary" || "btn-ghost"]}>
              <span class="text-race-terran font-bold">T</span>
            </button>
            <button phx-click="filter_race" phx-value-race="P" class={["btn btn-sm", @race_filter == "P" && "btn-primary" || "btn-ghost"]}>
              <span class="text-race-protoss font-bold">P</span>
            </button>
            <button phx-click="filter_race" phx-value-race="Z" class={["btn btn-sm", @race_filter == "Z" && "btn-primary" || "btn-ghost"]}>
              <span class="text-race-zerg font-bold">Z</span>
            </button>
          </div>
        </div>

        <div class="bg-base-100 rounded-box border border-base-content/5 overflow-hidden">
          <table class="table">
            <thead>
              <tr class="text-xs text-base-content/40">
                <th class="w-12">#</th>
                <th>Player</th>
                <th class="w-16">Race</th>
                <th class="w-20">Country</th>
                <th class="w-20 text-right">Rating</th>
              </tr>
            </thead>
            <tbody>
              <%= for {player, idx} <- Enum.with_index(@players, 1) do %>
                <tr class="hover:bg-base-200/50">
                  <td class={["font-mono text-sm", rank_color(idx)]}>{idx}</td>
                  <td>
                    <.link navigate={~p"/players/#{player.id}"} class="font-medium text-sm hover:text-primary transition-colors">
                      {player.name}
                    </.link>
                    <%= if player.aliases != [] do %>
                      <span class="text-xs text-base-content/30 ml-2">{Enum.at(player.aliases, 0)}</span>
                    <% end %>
                  </td>
                  <td><span class={["text-xs font-bold", race_color(player.race)]}>{player.race}</span></td>
                  <td class="text-sm text-base-content/50">{player.country}</td>
                  <td class="text-right font-mono text-sm">{player.rating}</td>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp race_color("T"), do: "text-race-terran"
  defp race_color("P"), do: "text-race-protoss"
  defp race_color("Z"), do: "text-race-zerg"
  defp race_color(_), do: "text-base-content"

  defp rank_color(1), do: "text-secondary font-bold"
  defp rank_color(2), do: "text-base-content/60 font-bold"
  defp rank_color(3), do: "text-base-content/40 font-bold"
  defp rank_color(_), do: "text-base-content/30"
end
