defmodule Project3Web.BookUserLiveTest do
  use Project3Web.ConnCase

  import Phoenix.LiveViewTest
  import Project3.LinkFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_book_user(_) do
    book_user = book_user_fixture()
    %{book_user: book_user}
  end

  describe "Index" do
    setup [:create_book_user]

    test "lists all book_users", %{conn: conn, book_user: book_user} do
      {:ok, _index_live, html} = live(conn, ~p"/book_users")

      assert html =~ "Listing Book users"
      assert html =~ book_user.name
    end

    test "saves new book_user", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/book_users")

      assert index_live |> element("a", "New Book user") |> render_click() =~
               "New Book user"

      assert_patch(index_live, ~p"/book_users/new")

      assert index_live
             |> form("#book_user-form", book_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#book_user-form", book_user: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/book_users")

      assert html =~ "Book user created successfully"
      assert html =~ "some name"
    end

    test "updates book_user in listing", %{conn: conn, book_user: book_user} do
      {:ok, index_live, _html} = live(conn, ~p"/book_users")

      assert index_live |> element("#book_users-#{book_user.id} a", "Edit") |> render_click() =~
               "Edit Book user"

      assert_patch(index_live, ~p"/book_users/#{book_user}/edit")

      assert index_live
             |> form("#book_user-form", book_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#book_user-form", book_user: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/book_users")

      assert html =~ "Book user updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes book_user in listing", %{conn: conn, book_user: book_user} do
      {:ok, index_live, _html} = live(conn, ~p"/book_users")

      assert index_live |> element("#book_users-#{book_user.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#book_user-#{book_user.id}")
    end
  end

  describe "Show" do
    setup [:create_book_user]

    test "displays book_user", %{conn: conn, book_user: book_user} do
      {:ok, _show_live, html} = live(conn, ~p"/book_users/#{book_user}")

      assert html =~ "Show Book user"
      assert html =~ book_user.name
    end

    test "updates book_user within modal", %{conn: conn, book_user: book_user} do
      {:ok, show_live, _html} = live(conn, ~p"/book_users/#{book_user}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Book user"

      assert_patch(show_live, ~p"/book_users/#{book_user}/show/edit")

      assert show_live
             |> form("#book_user-form", book_user: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#book_user-form", book_user: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/book_users/#{book_user}")

      assert html =~ "Book user updated successfully"
      assert html =~ "some updated name"
    end
  end
end
