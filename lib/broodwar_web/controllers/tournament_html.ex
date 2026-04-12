defmodule BroodwarWeb.TournamentHTML do
  use BroodwarWeb, :html

  embed_templates "tournament_html/*"

  def t(entry, field) do
    locale = Gettext.get_locale(BroodwarWeb.Gettext)
    ko_field = :"#{field}_ko"

    if locale == "ko" && Map.has_key?(entry, ko_field) do
      Map.get(entry, ko_field) || Map.get(entry, field)
    else
      Map.get(entry, field)
    end
  end

  def status_badge(:live) do
    {"bg-error/15 text-error border-error/20", gettext("LIVE")}
  end

  def status_badge(:active) do
    {"bg-success/15 text-success border-success/20", gettext("Active")}
  end

  def status_badge(:retired) do
    {"bg-base-content/10 text-base-content/40 border-base-content/10", gettext("Retired")}
  end

  def status_badge(:completed) do
    {"bg-base-content/5 text-base-content/30 border-base-content/5", ""}
  end

  def season_label(season) do
    "S#{season.season}"
  end

  attr :series, :map, required: true

  def series_card(assigns) do
    recent = assigns.series.seasons |> Enum.take(3)
    assigns = assign(assigns, :recent, recent)

    ~H"""
    <a
      href={"/tournaments/#{@series.slug}"}
      class="glass-card rounded-box p-5 glow-blue block group"
    >
      <div class="flex items-start justify-between mb-3">
        <div>
          <div class="flex items-center gap-2.5 mb-1">
            <span class="font-display text-base group-hover:text-primary transition-colors">{@series.short_name}</span>
            <% {badge_class, badge_label} = status_badge(@series.status) %>
            <span :if={badge_label != ""} class={["px-2 py-0.5 rounded text-[10px] font-semibold border", badge_class]}>
              {badge_label}
            </span>
          </div>
          <p class="text-xs text-base-content/35">{t(@series, :name)}</p>
        </div>
        <span class="text-[10px] text-base-content/25 font-medium">{@series.region}</span>
      </div>

      <p class="text-xs text-base-content/30 leading-relaxed mb-4 line-clamp-2">{t(@series, :description)}</p>

      <%!-- Recent seasons --%>
      <div :if={@recent != []} class="space-y-1.5">
        <div class="text-[10px] text-base-content/25 uppercase tracking-wider font-semibold mb-2">{gettext("Recent")}</div>
        <div :for={season <- @recent} class="flex items-center justify-between text-xs">
          <div class="flex items-center gap-2">
            <span class="font-stats text-base-content/40">{season_label(season)}</span>
            <span class="text-base-content/25">{season.year}</span>
            <span :if={season.status == :live} class="w-1.5 h-1.5 rounded-full bg-error animate-live-pulse"></span>
          </div>
          <div class="flex items-center gap-2">
            <span :if={season.winner} class="font-semibold text-base-content/60">{season.winner}</span>
            <span :if={season.winner} class="text-base-content/20">def.</span>
            <span :if={season.runner_up} class="text-base-content/30">{season.runner_up}</span>
            <span :if={season.status == :live} class="text-error font-semibold">{gettext("In Progress")}</span>
          </div>
        </div>
      </div>
    </a>
    """
  end
end
