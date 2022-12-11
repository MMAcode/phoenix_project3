defmodule Project3.JsonQuillFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project3.JsonQuill` context.
  """

  @doc """
  Generate a just_map.
  """
  def just_map_fixture(attrs \\ %{}) do
    {:ok, just_map} =
      attrs
      |> Enum.into(%{
        data: %{}
      })
      |> Project3.JsonQuill.create_just_map()

    just_map
  end
end
