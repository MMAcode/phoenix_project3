defmodule Project3.LinkFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project3.Link` context.
  """

  @doc """
  Generate a book_user.
  """
  def book_user_fixture(attrs \\ %{}) do
    {:ok, book_user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Project3.Link.create_book_user()

    book_user
  end

  @doc """
  Generate a book_of_user.
  """
  def book_of_user_fixture(attrs \\ %{}) do
    {:ok, book_of_user} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title"
      })
      |> Project3.Link.create_book_of_user()

    book_of_user
  end
end
