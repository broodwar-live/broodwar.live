defmodule BroodwarWeb.SEO do
  @moduledoc """
  Centralized SEO, Open Graph, JSON-LD, and meta tag rendering.

  Provides:
  - `meta_tags/1` component for `<head>` meta/OG/Twitter/hreflang tags
  - `json_ld/1` component for structured data
  - `on_mount/4` LiveView hook to track `current_path`
  """
  use Phoenix.Component
  use Gettext, backend: BroodwarWeb.Gettext

  @default_description "The community platform for StarCraft: Brood War competitive play — match stats, replay analysis, build orders, and live streams."
  @site_name "broodwar.live"
  @default_og_image "/images/og-default.png"

  # -- LiveView on_mount hook --

  def on_mount(:default, _params, _session, socket) do
    {:cont,
     Phoenix.LiveView.attach_hook(socket, :seo_path, :handle_params, fn _params, uri, socket ->
       path = URI.parse(uri).path
       {:cont, Phoenix.Component.assign(socket, :current_path, path)}
     end)}
  end

  # -- Meta tags component --

  attr :page_title, :string, default: nil
  attr :page_description, :string, default: nil
  attr :og_image, :string, default: nil
  attr :og_type, :string, default: "website"
  attr :current_path, :string, default: "/"
  attr :locale, :string, default: "en"

  def meta_tags(assigns) do
    assigns =
      assigns
      |> assign_new(:description, fn -> assigns[:page_description] || default_description() end)
      |> assign_new(:title, fn ->
        case assigns[:page_title] do
          nil -> "#{@site_name} — StarCraft: Brood War Community Hub"
          title -> "#{title} — #{@site_name}"
        end
      end)
      |> assign(:canonical, canonical_url(assigns[:current_path] || "/"))
      |> assign(:image, canonical_url(assigns[:og_image] || @default_og_image))
      |> assign(:site_name, @site_name)

    ~H"""
    <meta name="description" content={@description} />
    <link rel="canonical" href={@canonical} />
    <%!-- Open Graph --%>
    <meta property="og:title" content={@title} />
    <meta property="og:description" content={@description} />
    <meta property="og:image" content={@image} />
    <meta property="og:url" content={@canonical} />
    <meta property="og:type" content={@og_type} />
    <meta property="og:site_name" content={@site_name} />
    <meta property="og:locale" content={og_locale(@locale)} />
    <meta property="og:locale:alternate" content={og_locale(alternate_locale(@locale))} />
    <%!-- Twitter Card --%>
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content={@title} />
    <meta name="twitter:description" content={@description} />
    <meta name="twitter:image" content={@image} />
    <%!-- hreflang alternates --%>
    <link rel="alternate" hreflang="en" href={hreflang_url(@current_path, "en")} />
    <link rel="alternate" hreflang="ko" href={hreflang_url(@current_path, "ko")} />
    <link rel="alternate" hreflang="x-default" href={canonical_url(@current_path)} />
    """
  end

  # -- JSON-LD component --

  attr :current_path, :string, default: "/"
  attr :breadcrumbs, :list, default: nil

  def json_ld(assigns) do
    base_url = base_url()

    schemas =
      [
        %{
          "@context" => "https://schema.org",
          "@type" => "WebSite",
          "name" => @site_name,
          "url" => base_url,
          "potentialAction" => %{
            "@type" => "SearchAction",
            "target" => %{
              "@type" => "EntryPoint",
              "urlTemplate" => "#{base_url}/players?q={search_term_string}"
            },
            "query-input" => "required name=search_term_string"
          }
        },
        %{
          "@context" => "https://schema.org",
          "@type" => "Organization",
          "name" => @site_name,
          "url" => base_url,
          "logo" => "#{base_url}/images/logo.svg",
          "description" => @default_description,
          "sameAs" => [
            "https://github.com/broodwar-live",
            "https://discord.gg/broodwar"
          ]
        }
      ]
      |> maybe_add_breadcrumbs(assigns[:breadcrumbs], base_url)

    assigns = assign(assigns, :json, Jason.encode!(schemas))

    ~H"""
    <script type="application/ld+json">{Phoenix.HTML.raw(@json)}</script>
    """
  end

  # -- Helpers --

  def canonical_url(path) do
    base_url() <> (path || "/")
  end

  defp base_url do
    BroodwarWeb.Endpoint.url()
  end

  defp default_description do
    gettext("The community platform for StarCraft: Brood War competitive play — match stats, replay analysis, build orders, and live streams.")
  end

  defp og_locale("ko"), do: "ko_KR"
  defp og_locale(_), do: "en_US"

  defp alternate_locale("ko"), do: "en"
  defp alternate_locale(_), do: "ko"

  defp hreflang_url(path, locale) do
    canonical_url(path) <> "?locale=#{locale}"
  end

  defp maybe_add_breadcrumbs(schemas, nil, _base_url), do: schemas
  defp maybe_add_breadcrumbs(schemas, [], _base_url), do: schemas

  defp maybe_add_breadcrumbs(schemas, breadcrumbs, base_url) do
    items =
      breadcrumbs
      |> Enum.with_index(1)
      |> Enum.map(fn {{label, path}, position} ->
        %{
          "@type" => "ListItem",
          "position" => position,
          "name" => label,
          "item" => "#{base_url}#{path}"
        }
      end)

    breadcrumb_schema = %{
      "@context" => "https://schema.org",
      "@type" => "BreadcrumbList",
      "itemListElement" => items
    }

    schemas ++ [breadcrumb_schema]
  end
end
