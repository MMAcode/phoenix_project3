defmodule Project3.Miro.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :title, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :year])
    |> validate_required([:title, :author, :year])
  end
end
