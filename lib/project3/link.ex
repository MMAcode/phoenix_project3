defmodule Project3.Link do
  @moduledoc """
  The Link context.
  """

  import Ecto.Query, warn: false
  alias Project3.Repo

  alias Project3.Link.BookUser

  @doc """
  Returns the list of book_users.

  ## Examples

      iex> list_book_users()
      [%BookUser{}, ...]

  """
  def list_book_users do
    Repo.all(BookUser)
  end

  @doc """
  Gets a single book_user.

  Raises `Ecto.NoResultsError` if the Book user does not exist.

  ## Examples

      iex> get_book_user!(123)
      %BookUser{}

      iex> get_book_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_user!(id), do: Repo.get!(BookUser, id)

  @doc """
  Creates a book_user.

  ## Examples

      iex> create_book_user(%{field: value})
      {:ok, %BookUser{}}

      iex> create_book_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_user(attrs \\ %{}) do
    %BookUser{}
    |> BookUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_user.

  ## Examples

      iex> update_book_user(book_user, %{field: new_value})
      {:ok, %BookUser{}}

      iex> update_book_user(book_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_user(%BookUser{} = book_user, attrs) do
    book_user
    |> BookUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_user.

  ## Examples

      iex> delete_book_user(book_user)
      {:ok, %BookUser{}}

      iex> delete_book_user(book_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_user(%BookUser{} = book_user) do
    Repo.delete(book_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_user changes.

  ## Examples

      iex> change_book_user(book_user)
      %Ecto.Changeset{data: %BookUser{}}

  """
  def change_book_user(%BookUser{} = book_user, attrs \\ %{}) do
    BookUser.changeset(book_user, attrs)
  end

  alias Project3.Link.BookOfUser

  @doc """
  Returns the list of books_of_users.

  ## Examples

      iex> list_books_of_users()
      [%BookOfUser{}, ...]

  """
  def list_books_of_users do
    Repo.all(BookOfUser)
  end

  @doc """
  Gets a single book_of_user.

  Raises `Ecto.NoResultsError` if the Book of user does not exist.

  ## Examples

      iex> get_book_of_user!(123)
      %BookOfUser{}

      iex> get_book_of_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_of_user!(id), do: Repo.get!(BookOfUser, id)

  @doc """
  Creates a book_of_user.

  ## Examples

      iex> create_book_of_user(%{field: value})
      {:ok, %BookOfUser{}}

      iex> create_book_of_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_of_user(attrs \\ %{}) do
    %BookOfUser{}
    |> BookOfUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_of_user.

  ## Examples

      iex> update_book_of_user(book_of_user, %{field: new_value})
      {:ok, %BookOfUser{}}

      iex> update_book_of_user(book_of_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_of_user(%BookOfUser{} = book_of_user, attrs) do
    book_of_user
    |> BookOfUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_of_user.

  ## Examples

      iex> delete_book_of_user(book_of_user)
      {:ok, %BookOfUser{}}

      iex> delete_book_of_user(book_of_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_of_user(%BookOfUser{} = book_of_user) do
    Repo.delete(book_of_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_of_user changes.

  ## Examples

      iex> change_book_of_user(book_of_user)
      %Ecto.Changeset{data: %BookOfUser{}}

  """
  def change_book_of_user(%BookOfUser{} = book_of_user, attrs \\ %{}) do
    BookOfUser.changeset(book_of_user, attrs)
  end
end
