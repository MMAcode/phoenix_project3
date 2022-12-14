defmodule Project3Web.BookLive.Index do
  use Project3Web, :live_view

  alias Project3.Miro
  alias Project3.Miro.Book

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :books, list_books())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, Miro.get_book!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books")
    |> assign(:book, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book = Miro.get_book!(id)
    {:ok, _} = Miro.delete_book(book)

    {:noreply, assign(socket, :books, list_books())}
  end

  defp list_books do
    Miro.list_books()
  end
end
