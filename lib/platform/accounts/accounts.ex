defmodule Platform.Accounts do
  @moduledoc """
  The boundary for the Accounts system.
  """

  import Ecto.Query, warn: false
  alias Platform.Repo

  alias Platform.Accounts.Players

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Players{}, ...]

  """
  def list_players do
    Repo.all(Players)
  end

  @doc """
  Gets a single players.

  Raises `Ecto.NoResultsError` if the Players does not exist.

  ## Examples

      iex> get_players!(123)
      %Players{}

      iex> get_players!(456)
      ** (Ecto.NoResultsError)

  """
  def get_players!(id), do: Repo.get!(Players, id)

  @doc """
  Creates a players.

  ## Examples

      iex> create_players(%{field: value})
      {:ok, %Players{}}

      iex> create_players(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_players(attrs \\ %{}) do
    %Players{}
    |> Players.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a players.

  ## Examples

      iex> update_players(players, %{field: new_value})
      {:ok, %Players{}}

      iex> update_players(players, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_players(%Players{} = players, attrs) do
    players
    |> Players.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Players.

  ## Examples

      iex> delete_players(players)
      {:ok, %Players{}}

      iex> delete_players(players)
      {:error, %Ecto.Changeset{}}

  """
  def delete_players(%Players{} = players) do
    Repo.delete(players)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking players changes.

  ## Examples

      iex> change_players(players)
      %Ecto.Changeset{source: %Players{}}

  """
  def change_players(%Players{} = players) do
    Players.changeset(players, %{})
  end
end
