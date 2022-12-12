defmodule Project3.JsonQuill do
  @moduledoc """
  The JsonQuill context.
  """

  import Ecto.Query, warn: false
  alias Project3.Repo

  alias Project3.JsonQuill.JustMap

  @doc """
  Returns the list of just_maps.

  ## Examples

      iex> list_just_maps()
      [%JustMap{}, ...]

  """
  def list_just_maps do
    Repo.all(JustMap)
    # |> fn x -> dbg(["miro25", x]); x end.()
  end

  @doc """
  Gets a single just_map.

  Raises `Ecto.NoResultsError` if the Just map does not exist.

  ## Examples

      iex> get_just_map!(123)
      %JustMap{}

      iex> get_just_map!(456)
      ** (Ecto.NoResultsError)

  """
  def get_just_map!(id), do: Repo.get!(JustMap, id)

  @doc """
  Creates a just_map.

  ## Examples

      iex> create_just_map(%{field: value})
      {:ok, %JustMap{}}

      iex> create_just_map(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_just_map(attrs \\ %{}) do
    %JustMap{}
    |> JustMap.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a just_map.

  ## Examples

      iex> update_just_map(just_map, %{field: new_value})
      {:ok, %JustMap{}}

      iex> update_just_map(just_map, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_just_map(%JustMap{} = just_map, attrs) do
    just_map
    |> JustMap.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a just_map.

  ## Examples

      iex> delete_just_map(just_map)
      {:ok, %JustMap{}}

      iex> delete_just_map(just_map)
      {:error, %Ecto.Changeset{}}

  """
  def delete_just_map(%JustMap{} = just_map) do
    Repo.delete(just_map)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking just_map changes.

  ## Examples

      iex> change_just_map(just_map)
      %Ecto.Changeset{data: %JustMap{}}

  """
  def change_just_map(%JustMap{} = just_map, attrs \\ %{}) do
    JustMap.changeset(just_map, attrs)
  end
end
