defmodule Project3Web.BookUserLive.Index do
  use Project3Web, :live_view

  alias Project3.Link
  alias Project3.Link.BookUser

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :book_users, list_book_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book user")
    |> assign(:book_user, Link.get_book_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book user")
    |> assign(:book_user, %BookUser{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Book users")
    |> assign(:book_user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book_user = Link.get_book_user!(id)
    {:ok, _} = Link.delete_book_user(book_user)

    {:noreply, assign(socket, :book_users, list_book_users())}
  end

  defp list_book_users do
    Link.list_book_users()
  end
end
