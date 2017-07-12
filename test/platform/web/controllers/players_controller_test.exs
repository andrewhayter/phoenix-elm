defmodule Platform.Web.PlayersControllerTest do
  use Platform.Web.ConnCase

  alias Platform.Accounts

  @create_attrs %{score: 42, username: "some username"}
  @update_attrs %{score: 43, username: "some updated username"}
  @invalid_attrs %{score: nil, username: nil}

  def fixture(:players) do
    {:ok, players} = Accounts.create_players(@create_attrs)
    players
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, players_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Players"
  end

  test "renders form for new players", %{conn: conn} do
    conn = get conn, players_path(conn, :new)
    assert html_response(conn, 200) =~ "Player Sign Up Page"
  end

  test "creates players and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, players_path(conn, :create), players: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == players_path(conn, :show, id)

    conn = get conn, players_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Players"
  end

  test "does not create players and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, players_path(conn, :create), players: @invalid_attrs
    assert html_response(conn, 200) =~ "Player Sign Up Page"
  end

  test "renders form for editing chosen players", %{conn: conn} do
    players = fixture(:players)
    conn = get conn, players_path(conn, :edit, players)
    assert html_response(conn, 200) =~ "Edit Players"
  end

  test "updates chosen players and redirects when data is valid", %{conn: conn} do
    players = fixture(:players)
    conn = put conn, players_path(conn, :update, players), players: @update_attrs
    assert redirected_to(conn) == players_path(conn, :show, players)

    conn = get conn, players_path(conn, :show, players)
    assert html_response(conn, 200) =~ "some updated username"
  end

  test "does not update chosen players and renders errors when data is invalid", %{conn: conn} do
    players = fixture(:players)
    conn = put conn, players_path(conn, :update, players), players: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Players"
  end

  test "deletes chosen players", %{conn: conn} do
    players = fixture(:players)
    conn = delete conn, players_path(conn, :delete, players)
    assert redirected_to(conn) == players_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, players_path(conn, :show, players)
    end
  end
end
