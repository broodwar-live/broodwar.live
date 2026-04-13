defmodule BroodwarWeb.Plugs.SEO do
  @moduledoc """
  Plug that sets default SEO assigns on every browser request.

  Controllers and LiveViews can override these defaults.
  """
  import Plug.Conn
  use Gettext, backend: BroodwarWeb.Gettext

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> assign(:current_path, conn.request_path)
    |> assign(
      :page_description,
      gettext(
        "The community platform for StarCraft: Brood War competitive play — match stats, replay analysis, build orders, and live streams."
      )
    )
    |> assign(:og_image, "/images/og-default.png")
    |> assign(:og_type, "website")
  end
end
