defmodule Project3.Link.BookUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(book_user, attrs) do
    book_user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
