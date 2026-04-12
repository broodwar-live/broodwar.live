defmodule BroodwarWeb.BalanceLive do
  use BroodwarWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    stats = Broodwar.Matches.balance_stats()

    {:ok,
     socket
     |> assign(:page_title, "Balance")
     |> assign(:stats, stats)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <div class="mb-6">
          <h1 class="text-2xl font-bold">Matchup Balance</h1>
          <p class="text-sm text-base-content/50">Win rates across all recorded matches</p>
        </div>

        <div class="space-y-4">
          <%= for stat <- @stats do %>
            <div class="bg-base-100 rounded-box border border-base-content/5 p-5">
              <div class="flex items-center justify-between mb-3">
                <span class="font-semibold">{stat.matchup}</span>
                <span class="text-xs text-base-content/40">{stat.total} games</span>
              </div>

              <%= if stat.total > 0 do %>
                <div class="flex h-3 rounded-full overflow-hidden bg-base-300 mb-2">
                  <div class="bg-primary/70 rounded-l-full transition-all" style={"width: #{stat.pct_a}%"}></div>
                  <div class="bg-secondary/70 rounded-r-full transition-all" style={"width: #{stat.pct_b}%"}></div>
                </div>
                <div class="flex justify-between text-sm">
                  <span class={["font-mono", stat.pct_a > 50 && "text-primary font-bold" || "text-base-content/50"]}>
                    {matchup_left(stat.matchup)} {stat.pct_a}%
                  </span>
                  <span class={["font-mono", stat.pct_b > 50 && "text-secondary font-bold" || "text-base-content/50"]}>
                    {stat.pct_b}% {matchup_right(stat.matchup)}
                  </span>
                </div>
              <% else %>
                <p class="text-sm text-base-content/30 text-center py-2">No data yet</p>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp matchup_left(<<left::binary-size(1), "v", _::binary>>), do: race_name(left)
  defp matchup_left(_), do: "?"

  defp matchup_right(<<_::binary-size(1), "v", right::binary>>), do: race_name(right)
  defp matchup_right(_), do: "?"

  defp race_name("T"), do: "Terran"
  defp race_name("P"), do: "Protoss"
  defp race_name("Z"), do: "Zerg"
  defp race_name(_), do: "Unknown"
end
