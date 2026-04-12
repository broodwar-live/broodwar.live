defmodule BroodwarWeb.MatchesLive do
  use BroodwarWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    matches = Broodwar.Matches.list_matches()

    {:ok,
     socket
     |> assign(:page_title, "Matches")
     |> assign(:matches, matches)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="mb-6">
          <h1 class="text-2xl font-bold">Matches</h1>
          <p class="text-sm text-base-content/50">{length(@matches)} matches recorded</p>
        </div>

        <div class="space-y-2">
          <%= for match <- @matches do %>
            <.link navigate={~p"/matches/#{match.id}"} class="match-card bg-base-100 rounded-box border border-base-content/5 px-4 py-3 flex items-center gap-4 cursor-pointer block">
              <div class="hidden sm:block w-32 shrink-0">
                <div class="text-xs text-base-content/40">{match.tournament && match.tournament.short_name}</div>
                <div class="text-xs text-base-content/30">{match.round}</div>
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

              <div class="hidden sm:flex items-center gap-4 shrink-0">
                <span class="text-xs text-base-content/30 w-20 text-right">{match.map && match.map.name}</span>
                <span class="text-xs text-base-content/30 w-20 text-right">{format_date(match.played_at)}</span>
              </div>
            </.link>
          <% end %>
        </div>

        <%= if @matches == [] do %>
          <div class="text-center py-16 text-base-content/30">
            <.icon name="hero-trophy" class="size-12 mx-auto mb-3" />
            <p>No matches recorded yet.</p>
          </div>
        <% end %>
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

  defp format_date(nil), do: "—"
  defp format_date(dt), do: Calendar.strftime(dt, "%Y-%m-%d")
end
