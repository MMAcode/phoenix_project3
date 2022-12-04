defmodule Project3.Repo.Migrations.CreateBooksOfUsers do
  use Ecto.Migration

  def change do
    create table(:books_of_users) do
      add :title, :string
      add :author, :string
      add :boook_user_id, references(:book_users, on_delete: :nothing)

      timestamps()
    end

    create index(:books_of_users, [:boook_user_id])
  end
end
