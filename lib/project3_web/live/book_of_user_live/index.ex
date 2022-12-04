defmodule Project3Web.BookOfUserLive.Index do
  use Project3Web, :live_view

  alias Project3.Link
  alias Project3.Link.BookOfUser

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :books_of_users, list_books_of_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book of user")
    |> assign(:book_of_user, Link.get_book_of_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book of user")
    |> assign(:book_of_user, %BookOfUser{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books of users")
    |> assign(:book_of_user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book_of_user = Link.get_book_of_user!(id)
    {:ok, _} = Link.delete_book_of_user(book_of_user)

    {:noreply, assign(socket, :books_of_users, list_books_of_users())}
  end

  defp list_books_of_users do
    Link.list_books_of_users()
  end
end
