defmodule Project3.MiroFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project3.Miro` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title",
        year: 42
      })
      |> Project3.Miro.create_book()

    book
  end
end
