defmodule Project3.MiroTest do
  use Project3.DataCase

  alias Project3.Miro

  describe "books" do
    alias Project3.Miro.Book

    import Project3.MiroFixtures

    @invalid_attrs %{author: nil, title: nil, year: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Miro.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Miro.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{author: "some author", title: "some title", year: 42}

      assert {:ok, %Book{} = book} = Miro.create_book(valid_attrs)
      assert book.author == "some author"
      assert book.title == "some title"
      assert book.year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Miro.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{author: "some updated author", title: "some updated title", year: 43}

      assert {:ok, %Book{} = book} = Miro.update_book(book, update_attrs)
      assert book.author == "some updated author"
      assert book.title == "some updated title"
      assert book.year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Miro.update_book(book, @invalid_attrs)
      assert book == Miro.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Miro.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Miro.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Miro.change_book(book)
    end
  end
end
