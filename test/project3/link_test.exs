defmodule Project3.LinkTest do
  use Project3.DataCase

  alias Project3.Link

  describe "book_users" do
    alias Project3.Link.BookUser

    import Project3.LinkFixtures

    @invalid_attrs %{name: nil}

    test "list_book_users/0 returns all book_users" do
      book_user = book_user_fixture()
      assert Link.list_book_users() == [book_user]
    end

    test "get_book_user!/1 returns the book_user with given id" do
      book_user = book_user_fixture()
      assert Link.get_book_user!(book_user.id) == book_user
    end

    test "create_book_user/1 with valid data creates a book_user" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %BookUser{} = book_user} = Link.create_book_user(valid_attrs)
      assert book_user.name == "some name"
    end

    test "create_book_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Link.create_book_user(@invalid_attrs)
    end

    test "update_book_user/2 with valid data updates the book_user" do
      book_user = book_user_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %BookUser{} = book_user} = Link.update_book_user(book_user, update_attrs)
      assert book_user.name == "some updated name"
    end

    test "update_book_user/2 with invalid data returns error changeset" do
      book_user = book_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Link.update_book_user(book_user, @invalid_attrs)
      assert book_user == Link.get_book_user!(book_user.id)
    end

    test "delete_book_user/1 deletes the book_user" do
      book_user = book_user_fixture()
      assert {:ok, %BookUser{}} = Link.delete_book_user(book_user)
      assert_raise Ecto.NoResultsError, fn -> Link.get_book_user!(book_user.id) end
    end

    test "change_book_user/1 returns a book_user changeset" do
      book_user = book_user_fixture()
      assert %Ecto.Changeset{} = Link.change_book_user(book_user)
    end
  end

  describe "books_of_users" do
    alias Project3.Link.BookOfUser

    import Project3.LinkFixtures

    @invalid_attrs %{author: nil, title: nil}

    test "list_books_of_users/0 returns all books_of_users" do
      book_of_user = book_of_user_fixture()
      assert Link.list_books_of_users() == [book_of_user]
    end

    test "get_book_of_user!/1 returns the book_of_user with given id" do
      book_of_user = book_of_user_fixture()
      assert Link.get_book_of_user!(book_of_user.id) == book_of_user
    end

    test "create_book_of_user/1 with valid data creates a book_of_user" do
      valid_attrs = %{author: "some author", title: "some title"}

      assert {:ok, %BookOfUser{} = book_of_user} = Link.create_book_of_user(valid_attrs)
      assert book_of_user.author == "some author"
      assert book_of_user.title == "some title"
    end

    test "create_book_of_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Link.create_book_of_user(@invalid_attrs)
    end

    test "update_book_of_user/2 with valid data updates the book_of_user" do
      book_of_user = book_of_user_fixture()
      update_attrs = %{author: "some updated author", title: "some updated title"}

      assert {:ok, %BookOfUser{} = book_of_user} = Link.update_book_of_user(book_of_user, update_attrs)
      assert book_of_user.author == "some updated author"
      assert book_of_user.title == "some updated title"
    end

    test "update_book_of_user/2 with invalid data returns error changeset" do
      book_of_user = book_of_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Link.update_book_of_user(book_of_user, @invalid_attrs)
      assert book_of_user == Link.get_book_of_user!(book_of_user.id)
    end

    test "delete_book_of_user/1 deletes the book_of_user" do
      book_of_user = book_of_user_fixture()
      assert {:ok, %BookOfUser{}} = Link.delete_book_of_user(book_of_user)
      assert_raise Ecto.NoResultsError, fn -> Link.get_book_of_user!(book_of_user.id) end
    end

    test "change_book_of_user/1 returns a book_of_user changeset" do
      book_of_user = book_of_user_fixture()
      assert %Ecto.Changeset{} = Link.change_book_of_user(book_of_user)
    end
  end
end
