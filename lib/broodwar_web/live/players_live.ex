defmodule BroodwarWeb.PlayersLive do
  use BroodwarWeb, :live_view

  alias Broodwar.Players.Player

  @impl true
  def mount(_params, _session, socket) do
    players = Broodwar.Players.list_players()

    {:ok,
     socket
     |> assign(:page_title, "Players")
     |> assign(:players, players)
     |> assign(:race_filter, nil)
     |> assign(:status_filter, nil)
     |> assign(:search, "")}
  end

  @impl true
  def handle_event("filter_race", %{"race" => race}, socket) do
    race = if race == "", do: nil, else: race
    {:noreply, socket |> assign(:race_filter, race) |> apply_filters()}
  end

  @impl true
  def handle_event("filter_status", %{"status" => status}, socket) do
    status = if status == "", do: nil, else: status
    {:noreply, socket |> assign(:status_filter, status) |> apply_filters()}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    {:noreply, socket |> assign(:search, query) |> apply_filters()}
  end

  defp apply_filters(socket) do
    players =
      Broodwar.Players.list_players(
        race: socket.assigns.race_filter,
        status: socket.assigns.status_filter,
        search: socket.assigns.search
      )

    assign(socket, :players, players)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <%!-- Header --%>
      <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-10 pb-6">
        <h1 class="font-display text-3xl tracking-tight">{gettext("Players")}</h1>
        <p class="mt-1 text-base-content/40 text-sm">{length(@players)} {gettext("players")}</p>
      </section>

      <%!-- Filters --%>
      <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-6">
        <div class="flex flex-wrap items-center gap-3">
          <%!-- Search --%>
          <form phx-change="search" class="flex-1 min-w-[200px] max-w-sm">
            <input
              type="text"
              name="q"
              value={@search}
              placeholder={gettext("Search players...")}
              phx-debounce="300"
              class="input input-sm input-bordered w-full bg-base-100/50 border-primary/10 focus:border-primary/30"
            />
          </form>

          <%!-- Race filter --%>
          <div class="flex items-center gap-1">
            <button phx-click="filter_race" phx-value-race="" class={["btn btn-sm", !@race_filter && "btn-primary" || "btn-ghost border-primary/10"]}>
              {gettext("All")}
            </button>
            <button phx-click="filter_race" phx-value-race="T" class={["btn btn-sm", @race_filter == "T" && "btn-primary" || "btn-ghost border-primary/10"]}>
              <span class="text-race-terran font-bold">T</span>
            </button>
            <button phx-click="filter_race" phx-value-race="P" class={["btn btn-sm", @race_filter == "P" && "btn-primary" || "btn-ghost border-primary/10"]}>
              <span class="text-race-protoss font-bold">P</span>
            </button>
            <button phx-click="filter_race" phx-value-race="Z" class={["btn btn-sm", @race_filter == "Z" && "btn-primary" || "btn-ghost border-primary/10"]}>
              <span class="text-race-zerg font-bold">Z</span>
            </button>
          </div>

          <%!-- Status filter --%>
          <div class="flex items-center gap-1">
            <button phx-click="filter_status" phx-value-status="" class={["btn btn-sm", !@status_filter && "btn-ghost border-primary/10 text-base-content/50" || "btn-ghost border-primary/10"]}>
              {gettext("All")}
            </button>
            <button phx-click="filter_status" phx-value-status="active" class={["btn btn-sm", @status_filter == "active" && "btn-success btn-soft" || "btn-ghost border-primary/10"]}>
              {gettext("Active")}
            </button>
            <button phx-click="filter_status" phx-value-status="inactive" class={["btn btn-sm", @status_filter == "inactive" && "btn-ghost btn-active" || "btn-ghost border-primary/10"]}>
              {gettext("Retired")}
            </button>
          </div>
        </div>
      </section>

      <%!-- Player Cards Grid --%>
      <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-20">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
          <.link
            :for={player <- @players}
            navigate={~p"/players/#{player.id}"}
            class="glass-card rounded-box p-5 glow-blue block group"
          >
            <div class="flex items-start gap-4">
              <%!-- Avatar --%>
              <div :if={player.image_url} class="w-14 h-14 rounded-xl overflow-hidden shrink-0 bg-base-300 border border-base-content/5">
                <img src={player.image_url} alt={player.name} class="w-full h-full object-cover" />
              </div>
              <div :if={!player.image_url} class={[
                "w-14 h-14 rounded-xl flex items-center justify-center text-xl font-black text-base-100 shrink-0",
                race_bg(player.race)
              ]}>
                {String.first(player.name)}
              </div>

              <div class="flex-1 min-w-0">
                <%!-- Name + Race --%>
                <div class="flex items-center gap-2 mb-0.5">
                  <span class="font-semibold text-base group-hover:text-primary transition-colors truncate">{player.name}</span>
                  <span class={["text-[10px] font-bold shrink-0", race_color(player.race)]}>{player.race}</span>
                </div>

                <%!-- Real name --%>
                <div :if={player.real_name_ko || player.real_name} class="text-xs text-base-content/35 truncate">
                  {player.real_name_ko || player.real_name}
                </div>

                <%!-- Meta row --%>
                <div class="flex items-center gap-2 mt-2 text-[11px] text-base-content/25">
                  <span :if={Player.age(player)} class="flex items-center gap-1">
                    {Player.age(player)}y
                  </span>
                  <span :if={player.country}>
                    {flag_emoji(player.country)}
                  </span>
                  <span :if={player.team && player.team != "Free Agent" && player.team != "Retired"} class="truncate">
                    {player.team}
                  </span>
                  <span :if={player.status == "inactive"} class="px-1.5 py-0.5 rounded text-[9px] font-semibold bg-base-content/5 text-base-content/30">
                    {gettext("Retired")}
                  </span>
                </div>
              </div>
            </div>

            <%!-- Rating --%>
            <div :if={player.rating} class="mt-3 pt-3 border-t border-base-content/5 flex items-center justify-between">
              <span class="text-[10px] text-base-content/20 uppercase tracking-wider font-semibold">{gettext("Rating")}</span>
              <span class="font-stats text-sm text-base-content/50">{player.rating}</span>
            </div>
          </.link>
        </div>

        <div :if={@players == []} class="text-center py-16 text-base-content/30">
          {gettext("No players found.")}
        </div>
      </section>
    </Layouts.app>
    """
  end

  defp race_color("T"), do: "text-race-terran"
  defp race_color("P"), do: "text-race-protoss"
  defp race_color("Z"), do: "text-race-zerg"
  defp race_color(_), do: "text-base-content"

  defp race_bg("T"), do: "bg-race-terran"
  defp race_bg("P"), do: "bg-race-protoss"
  defp race_bg("Z"), do: "bg-race-zerg"
  defp race_bg(_), do: "bg-base-content"

  defp flag_emoji("KR"), do: "\u{1F1F0}\u{1F1F7}"
  defp flag_emoji("US"), do: "\u{1F1FA}\u{1F1F8}"
  defp flag_emoji("DE"), do: "\u{1F1E9}\u{1F1EA}"
  defp flag_emoji("PL"), do: "\u{1F1F5}\u{1F1F1}"
  defp flag_emoji("CA"), do: "\u{1F1E8}\u{1F1E6}"
  defp flag_emoji("RU"), do: "\u{1F1F7}\u{1F1FA}"
  defp flag_emoji("UA"), do: "\u{1F1FA}\u{1F1E6}"
  defp flag_emoji("CZ"), do: "\u{1F1E8}\u{1F1FF}"
  defp flag_emoji("HU"), do: "\u{1F1ED}\u{1F1FA}"
  defp flag_emoji(_), do: ""
end
