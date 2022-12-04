defmodule Project3.Link.BookOfUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books_of_users" do
    field :author, :string
    field :title, :string
    field :boook_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_of_user, attrs) do
    book_of_user
    |> cast(attrs, [:title, :author])
    |> validate_required([:title, :author])
  end
end
