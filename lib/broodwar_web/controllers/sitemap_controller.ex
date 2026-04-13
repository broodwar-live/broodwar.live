defmodule BroodwarWeb.SitemapController do
  use BroodwarWeb, :controller

  @paths [
    {"/", "1.0", "daily"},
    {"/players", "0.8", "daily"},
    {"/matches", "0.8", "daily"},
    {"/tournaments", "0.8", "daily"},
    {"/replays", "0.8", "daily"},
    {"/builds", "0.8", "daily"},
    {"/balance", "0.7", "weekly"},
    {"/wiki", "0.7", "weekly"},
    {"/wiki/races/terran", "0.6", "monthly"},
    {"/wiki/races/protoss", "0.6", "monthly"},
    {"/wiki/races/zerg", "0.6", "monthly"},
    {"/wiki/abilities", "0.6", "monthly"},
    {"/wiki/maps", "0.6", "monthly"}
  ]

  def index(conn, _params) do
    base_url = BroodwarWeb.Endpoint.url()

    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(200, render_sitemap(base_url))
  end

  defp render_sitemap(base_url) do
    urls =
      Enum.map_join(@paths, "\n", fn {path, priority, changefreq} ->
        loc = "#{base_url}#{path}"

        """
          <url>
            <loc>#{loc}</loc>
            <xhtml:link rel="alternate" hreflang="en" href="#{loc}?locale=en"/>
            <xhtml:link rel="alternate" hreflang="ko" href="#{loc}?locale=ko"/>
            <xhtml:link rel="alternate" hreflang="x-default" href="#{loc}"/>
            <changefreq>#{changefreq}</changefreq>
            <priority>#{priority}</priority>
          </url>\
        """
      end)

    """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
            xmlns:xhtml="http://www.w3.org/1999/xhtml">
    #{urls}
    </urlset>
    """
  end
end
