defmodule BroodwarWeb.Plugs.Locale do
  @moduledoc """
  Plug that sets the locale from query param, cookie, or Accept-Language header.

  Priority: ?locale= query param > locale cookie > Accept-Language header > default "en"
  """
  import Plug.Conn

  @locales ~w(en ko)
  @cookie_key "broodwar_locale"
  @cookie_max_age 365 * 24 * 60 * 60

  def init(opts), do: opts

  def call(conn, _opts) do
    locale = locale_from_params(conn) || locale_from_cookie(conn) || locale_from_header(conn) || "en"

    Gettext.put_locale(BroodwarWeb.Gettext, locale)

    conn
    |> put_resp_cookie(@cookie_key, locale, max_age: @cookie_max_age)
    |> assign(:locale, locale)
  end

  defp locale_from_params(conn) do
    case conn.params["locale"] do
      locale when locale in @locales -> locale
      _ -> nil
    end
  end

  defp locale_from_cookie(conn) do
    case conn.cookies[@cookie_key] do
      locale when locale in @locales -> locale
      _ -> nil
    end
  end

  defp locale_from_header(conn) do
    conn
    |> get_req_header("accept-language")
    |> List.first("")
    |> parse_accept_language()
  end

  defp parse_accept_language(header) do
    header
    |> String.split(",")
    |> Enum.map(fn part ->
      part |> String.trim() |> String.split(";") |> List.first() |> String.trim() |> String.downcase()
    end)
    |> Enum.find_value(fn
      "ko" <> _ -> "ko"
      "en" <> _ -> "en"
      _ -> nil
    end)
  end
end
