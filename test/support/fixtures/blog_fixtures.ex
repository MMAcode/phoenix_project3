defmodule Project3.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project3.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Project3.Blog.create_post()

    post
  end
end
