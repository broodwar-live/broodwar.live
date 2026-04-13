defmodule BroodwarWeb.PageController do
  use BroodwarWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def offline(conn, _params) do
    conn
    |> put_layout(false)
    |> render(:offline)
  end
end
