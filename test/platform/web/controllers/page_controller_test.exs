defmodule Platform.Web.PageControllerTest do
  use Platform.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Player Sign Up"
  end

  test "redirects unauthenticated users for index page", %{conn: conn} do
    conn = get conn, page_path(conn, :index)
    assert html_response(conn, 302) =~ "redirect"
  end
end
