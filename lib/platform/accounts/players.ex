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
    |> cast(attrs, [:username, :password ,:score, :display_name])
    |> validate_required([:username])
    |> validate_length(:username, min: 2, max: 35)
    |> validate_length(:password, min: 6, max: 35)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ -> changeset
    end
  end
end
