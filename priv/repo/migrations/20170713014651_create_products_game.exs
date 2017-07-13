defmodule Platform.Repo.Migrations.CreatePlatform.Products.Game do
  use Ecto.Migration

  def change do
    create table(:products_games) do
      add :title, :string
      add :description, :string
      add :author_id, :integer

      timestamps()
    end

  end
end
