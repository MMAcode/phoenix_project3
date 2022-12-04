defmodule Project3.Repo.Migrations.CreateBookUsers do
  use Ecto.Migration

  def change do
    create table(:book_users) do
      add :name, :string

      timestamps()
    end
  end
end
