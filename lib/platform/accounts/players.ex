defmodule Platform.Accounts.Players do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Players


  schema "accounts_players" do
    field :score, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%Players{} = players, attrs) do
    players
    |> cast(attrs, [:username, :score])
    |> validate_required([:username, :score])
  end
end
