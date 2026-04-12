defmodule BroodwarWeb.BuildsLive do
  use BroodwarWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    builds = Broodwar.BuildsContext.list_builds()

    {:ok,
     socket
     |> assign(:page_title, "Builds")
     |> assign(:builds, builds)
     |> assign(:matchup_filter, nil)}
  end

  @impl true
  def handle_event("filter_matchup", %{"matchup" => matchup}, socket) do
    matchup = if matchup == "", do: nil, else: matchup
    builds = Broodwar.BuildsContext.list_builds(matchup: matchup)
    {:noreply, assign(socket, builds: builds, matchup_filter: matchup)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h1 class="text-2xl font-bold">Builds</h1>
            <p class="text-sm text-base-content/50">{length(@builds)} build orders</p>
          </div>

          <div class="flex flex-wrap gap-1">
            <button phx-click="filter_matchup" phx-value-matchup="" class={["btn btn-xs", !@matchup_filter && "btn-primary" || "btn-ghost"]}>All</button>
            <%= for mu <- ~w(TvZ TvP PvZ TvT PvP ZvZ) do %>
              <button phx-click="filter_matchup" phx-value-matchup={mu} class={["btn btn-xs", @matchup_filter == mu && "btn-primary" || "btn-ghost"]}>{mu}</button>
            <% end %>
          </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          <%= for build <- @builds do %>
            <.link navigate={~p"/builds/#{build.id}"} class="match-card bg-base-100 rounded-box border border-base-content/5 p-4 cursor-pointer block">
              <div class="flex items-center justify-between mb-2">
                <div class="flex items-center gap-2">
                  <span class={[
                    "w-6 h-6 rounded flex items-center justify-center text-xs font-bold text-base-100",
                    race_bg(build.race)
                  ]}>
                    {build.race}
                  </span>
                  <span class="font-medium text-sm">{build.name}</span>
                </div>
                <span class="badge badge-sm badge-ghost text-xs">{build.matchup}</span>
              </div>
              <p class="text-xs text-base-content/50 leading-relaxed mb-3">{build.description}</p>
              <div class="flex items-center gap-4 text-xs text-base-content/40">
                <span>{build.games} games</span>
                <%= if build.winrate do %>
                  <span class={[
                    "font-medium",
                    build.winrate >= 55 && "text-success",
                    build.winrate < 55 && build.winrate >= 50 && "text-base-content/60",
                    build.winrate < 50 && "text-error"
                  ]}>
                    {build.winrate}% winrate
                  </span>
                <% end %>
                <%= for tag <- Enum.take(build.tags, 2) do %>
                  <span class="badge badge-xs badge-ghost">{tag}</span>
                <% end %>
              </div>
            </.link>
          <% end %>
        </div>

        <%= if @builds == [] do %>
          <div class="text-center py-16 text-base-content/30">
            <.icon name="hero-queue-list" class="size-12 mx-auto mb-3" />
            <p>No builds found.</p>
          </div>
        <% end %>
      </div>
    </Layouts.app>
    """
  end

  defp race_bg("T"), do: "bg-race-terran"
  defp race_bg("P"), do: "bg-race-protoss"
  defp race_bg("Z"), do: "bg-race-zerg"
  defp race_bg(_), do: "bg-base-content"
end
