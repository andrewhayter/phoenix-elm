defmodule Platform.Accounts.Players do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Accounts.Players

  schema "accounts_players" do
    field :display_name, :string
    field :username, :string
    field :score, :integer
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(%Players{} = players, attrs) do
    players
    |> cast(attrs, [:username, :score, :display_name])
    |> validate_required([:username])
  end
end
