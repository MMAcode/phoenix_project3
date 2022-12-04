defmodule Project3Web.BookOfUserLiveTest do
  use Project3Web.ConnCase

  import Phoenix.LiveViewTest
  import Project3.LinkFixtures

  @create_attrs %{author: "some author", title: "some title"}
  @update_attrs %{author: "some updated author", title: "some updated title"}
  @invalid_attrs %{author: nil, title: nil}

  defp create_book_of_user(_) do
    book_of_user = book_of_user_fixture()
    %{book_of_user: book_of_user}
  end

  describe "Index" do
    setup [:create_book_of_user]

    test "lists all books_of_users", %{conn: conn, book_of_user: book_of_user} do
      {:ok, _index_live, html} = live(conn, ~p"/books_of_users")

      assert html =~ "Listing Books of users"
      assert html =~ book_of_user.author
    end

    test "saves new book_of_user", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/books_of_users")

      assert index_live |> element("a", "New Book of user") |> render_click() =~
               "New Book of user"

      assert_patch(index_live, ~p"/books_of_users/new")

      assert index_live
             |> form("#book_of_user-form", book_of_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#book_of_user-form", book_of_user: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/books_of_users")

      assert html =~ "Book of user created successfully"
      assert html =~ "some author"
    end

    test "updates book_of_user in listing", %{conn: conn, book_of_user: book_of_user} do
      {:ok, index_live, _html} = live(conn, ~p"/books_of_users")

      assert index_live |> element("#books_of_users-#{book_of_user.id} a", "Edit") |> render_click() =~
               "Edit Book of user"

      assert_patch(index_live, ~p"/books_of_users/#{book_of_user}/edit")

      assert index_live
             |> form("#book_of_user-form", book_of_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#book_of_user-form", book_of_user: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/books_of_users")

      assert html =~ "Book of user updated successfully"
      assert html =~ "some updated author"
    end

    test "deletes book_of_user in listing", %{conn: conn, book_of_user: book_of_user} do
      {:ok, index_live, _html} = live(conn, ~p"/books_of_users")

      assert index_live |> element("#books_of_users-#{book_of_user.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#book_of_user-#{book_of_user.id}")
    end
  end

  describe "Show" do
    setup [:create_book_of_user]

    test "displays book_of_user", %{conn: conn, book_of_user: book_of_user} do
      {:ok, _show_live, html} = live(conn, ~p"/books_of_users/#{book_of_user}")

      assert html =~ "Show Book of user"
      assert html =~ book_of_user.author
    end

    test "updates book_of_user within modal", %{conn: conn, book_of_user: book_of_user} do
      {:ok, show_live, _html} = live(conn, ~p"/books_of_users/#{book_of_user}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Book of user"

      assert_patch(show_live, ~p"/books_of_users/#{book_of_user}/show/edit")

      assert show_live
             |> form("#book_of_user-form", book_of_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#book_of_user-form", book_of_user: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/books_of_users/#{book_of_user}")

      assert html =~ "Book of user updated successfully"
      assert html =~ "some updated author"
    end
  end
end
