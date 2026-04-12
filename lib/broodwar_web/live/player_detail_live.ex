defmodule BroodwarWeb.PlayerDetailLive do
  use BroodwarWeb, :live_view

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    player = Broodwar.Players.get_player!(id)
    matches = Broodwar.Players.get_player_matches(player.id)

    {:ok,
     socket
     |> assign(:page_title, player.name)
     |> assign(:player, player)
     |> assign(:matches, matches)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <%!-- Player Header --%>
        <div class="bg-base-100 rounded-box border border-base-content/5 card-accent-top p-6 mb-6">
          <div class="flex items-start gap-4">
            <div class={[
              "w-14 h-14 rounded-lg flex items-center justify-center text-xl font-bold",
              race_bg(@player.race)
            ]}>
              {@player.race}
            </div>
            <div class="flex-1">
              <h1 class="text-2xl font-bold">{@player.name}</h1>
              <div class="flex items-center gap-3 mt-1 text-sm text-base-content/50">
                <span class={["font-bold", race_color(@player.race)]}>{race_name(@player.race)}</span>
                <span>&middot;</span>
                <span>{@player.country}</span>
                <%= if @player.aliases != [] do %>
                  <span>&middot;</span>
                  <span>{Enum.join(@player.aliases, ", ")}</span>
                <% end %>
              </div>
            </div>
            <div class="text-right">
              <div class="text-2xl font-mono font-bold">{@player.rating}</div>
              <div class="text-xs text-base-content/40">Rating</div>
            </div>
          </div>
        </div>

        <%!-- Match History --%>
        <div class="bg-base-100 rounded-box border border-base-content/5 card-accent-top">
          <div class="p-5">
            <h2 class="font-semibold mb-4">Match History ({length(@matches)})</h2>

            <%= if @matches == [] do %>
              <p class="text-sm text-base-content/40 py-4 text-center">No matches recorded yet.</p>
            <% else %>
              <div class="space-y-2">
                <%= for match <- @matches do %>
                  <.link navigate={~p"/matches/#{match.id}"} class="match-card bg-base-200/30 rounded-lg px-4 py-3 flex items-center gap-4 cursor-pointer block">
                    <div class="hidden sm:block w-28 shrink-0">
                      <span class="text-xs text-base-content/40">{match.tournament && match.tournament.short_name} {match.round}</span>
                    </div>

                    <div class="flex-1 flex items-center justify-center gap-3 min-w-0">
                      <div class="flex items-center gap-2 flex-1 justify-end min-w-0">
                        <span class={[
                          "font-medium text-sm truncate",
                          winner?(match, :a) && "text-base-content",
                          !winner?(match, :a) && "text-base-content/50"
                        ]}>
                          {match.player_a.name}
                        </span>
                        <span class={["text-xs font-bold shrink-0", race_color(match.race_a)]}>{match.race_a}</span>
                      </div>

                      <div class="flex items-center gap-1.5 shrink-0 font-mono text-sm">
                        <span class={[winner?(match, :a) && "text-secondary font-bold", !winner?(match, :a) && "text-base-content/40"]}>{match.score_a}</span>
                        <span class="text-base-content/20">:</span>
                        <span class={[winner?(match, :b) && "text-secondary font-bold", !winner?(match, :b) && "text-base-content/40"]}>{match.score_b}</span>
                      </div>

                      <div class="flex items-center gap-2 flex-1 min-w-0">
                        <span class={["text-xs font-bold shrink-0", race_color(match.race_b)]}>{match.race_b}</span>
                        <span class={[
                          "font-medium text-sm truncate",
                          winner?(match, :b) && "text-base-content",
                          !winner?(match, :b) && "text-base-content/50"
                        ]}>
                          {match.player_b.name}
                        </span>
                      </div>
                    </div>

                    <div class="hidden sm:block w-24 text-right">
                      <span class="text-xs text-base-content/30">{format_date(match.played_at)}</span>
                    </div>
                  </.link>
                <% end %>
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp winner?(match, :a), do: match.score_a > match.score_b
  defp winner?(match, :b), do: match.score_b > match.score_a

  defp race_color("T"), do: "text-race-terran"
  defp race_color("P"), do: "text-race-protoss"
  defp race_color("Z"), do: "text-race-zerg"
  defp race_color(_), do: "text-base-content"

  defp race_bg("T"), do: "bg-race-terran/20 text-race-terran"
  defp race_bg("P"), do: "bg-race-protoss/20 text-race-protoss"
  defp race_bg("Z"), do: "bg-race-zerg/20 text-race-zerg"
  defp race_bg(_), do: "bg-base-300 text-base-content"

  defp race_name("T"), do: "Terran"
  defp race_name("P"), do: "Protoss"
  defp race_name("Z"), do: "Zerg"
  defp race_name(_), do: "Unknown"

  defp format_date(nil), do: "—"
  defp format_date(dt), do: Calendar.strftime(dt, "%Y-%m-%d")
end
