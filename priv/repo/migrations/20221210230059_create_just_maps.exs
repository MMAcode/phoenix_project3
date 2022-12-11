defmodule Project3.Repo.Migrations.CreateJustMaps do
  use Ecto.Migration

  def change do
    create table(:just_maps) do
      add :data, :map

      timestamps()
    end
  end
end
