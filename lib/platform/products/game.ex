defmodule Platform.Products.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Platform.Products.Game


  schema "products_games" do
    field :author_id, :integer
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Game{} = game, attrs) do
    game
    |> cast(attrs, [:title, :description, :author_id])
    |> validate_required([:title, :description, :author_id])
  end
end
