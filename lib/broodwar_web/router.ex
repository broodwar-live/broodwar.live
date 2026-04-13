defmodule BroodwarWeb.Router do
  use BroodwarWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BroodwarWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BroodwarWeb.Plugs.Locale
    plug BroodwarWeb.Plugs.SEO
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BroodwarWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/offline", PageController, :offline
    get "/sitemap.xml", SitemapController, :index

    live_session :default, on_mount: [{BroodwarWeb.SEO, :default}] do
      live "/replays", ReplayLive
      live "/replays/:id", ReplayDetailLive
      live "/players", PlayersLive
      live "/players/:id", PlayerDetailLive
      live "/matches", MatchesLive
      live "/matches/:id", MatchDetailLive
      live "/builds", BuildsLive
      live "/builds/:id", BuildDetailLive
      live "/balance", BalanceLive
    end

    get "/tournaments", TournamentController, :index
    get "/tournaments/:slug", TournamentController, :show
    get "/tournaments/:slug/:season", TournamentController, :season

    get "/wiki", WikiController, :index
    get "/wiki/races/:slug", WikiController, :race
    get "/wiki/units/:slug", WikiController, :unit
    get "/wiki/buildings/:slug", WikiController, :building
    get "/wiki/abilities", WikiController, :abilities
    get "/wiki/abilities/:slug", WikiController, :ability
    get "/wiki/maps", WikiController, :maps
    get "/wiki/maps/:slug", WikiController, :map
  end

  scope "/api", BroodwarWeb.Api do
    pipe_through :api

    resources "/players", PlayerController, only: [:index, :show] do
      get "/matches", PlayerController, :matches
      get "/stats", PlayerController, :stats
    end

    resources "/matches", MatchController, only: [:index, :show]
    resources "/replays", ReplayController, only: [:index, :show, :create]
    resources "/builds", BuildController, only: [:index, :show]
    resources "/maps", MapController, only: [:index, :show]
    resources "/streams", StreamController, only: [:index, :show]

    get "/tournaments", TournamentController, :index
    get "/tournaments/:slug", TournamentController, :show
    get "/tournaments/:slug/:season", TournamentController, :season

    get "/balance", BalanceController, :index
  end
end
