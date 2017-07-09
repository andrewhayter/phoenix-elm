defmodule Platform.AccountsTest do
  use Platform.DataCase

  alias Platform.Accounts

  describe "players" do
    alias Platform.Accounts.Players

    @valid_attrs %{score: 42, username: "some username"}
    @update_attrs %{score: 43, username: "some updated username"}
    @invalid_attrs %{score: nil, username: nil}

    def players_fixture(attrs \\ %{}) do
      {:ok, players} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_players()

      players
    end

    test "list_players/0 returns all players" do
      players = players_fixture()
      assert Accounts.list_players() == [players]
    end

    test "get_players!/1 returns the players with given id" do
      players = players_fixture()
      assert Accounts.get_players!(players.id) == players
    end

    test "create_players/1 with valid data creates a players" do
      assert {:ok, %Players{} = players} = Accounts.create_players(@valid_attrs)
      assert players.score == 42
      assert players.username == "some username"
    end

    test "create_players/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_players(@invalid_attrs)
    end

    test "update_players/2 with valid data updates the players" do
      players = players_fixture()
      assert {:ok, players} = Accounts.update_players(players, @update_attrs)
      assert %Players{} = players
      assert players.score == 43
      assert players.username == "some updated username"
    end

    test "update_players/2 with invalid data returns error changeset" do
      players = players_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_players(players, @invalid_attrs)
      assert players == Accounts.get_players!(players.id)
    end

    test "delete_players/1 deletes the players" do
      players = players_fixture()
      assert {:ok, %Players{}} = Accounts.delete_players(players)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_players!(players.id) end
    end

    test "change_players/1 returns a players changeset" do
      players = players_fixture()
      assert %Ecto.Changeset{} = Accounts.change_players(players)
    end
  end
end
