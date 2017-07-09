defmodule Platform.Web.PlayersController do
  use Platform.Web, :controller

  alias Platform.Accounts

  def index(conn, _params) do
    players = Accounts.list_players()
    render(conn, "index.html", players: players)
  end

  def new(conn, _params) do
    changeset = Accounts.change_players(%Platform.Accounts.Players{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"players" => players_params}) do
    case Accounts.create_players(players_params) do
      {:ok, players} ->
        conn
        |> put_flash(:info, "Players created successfully.")
        |> redirect(to: players_path(conn, :show, players))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    players = Accounts.get_players!(id)
    render(conn, "show.html", players: players)
  end

  def edit(conn, %{"id" => id}) do
    players = Accounts.get_players!(id)
    changeset = Accounts.change_players(players)
    render(conn, "edit.html", players: players, changeset: changeset)
  end

  def update(conn, %{"id" => id, "players" => players_params}) do
    players = Accounts.get_players!(id)

    case Accounts.update_players(players, players_params) do
      {:ok, players} ->
        conn
        |> put_flash(:info, "Players updated successfully.")
        |> redirect(to: players_path(conn, :show, players))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", players: players, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    players = Accounts.get_players!(id)
    {:ok, _players} = Accounts.delete_players(players)

    conn
    |> put_flash(:info, "Players deleted successfully.")
    |> redirect(to: players_path(conn, :index))
  end
end
