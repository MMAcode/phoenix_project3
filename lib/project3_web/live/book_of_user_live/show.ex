defmodule Project3Web.BookOfUserLive.Show do
  use Project3Web, :live_view

  alias Project3.Link

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:book_of_user, Link.get_book_of_user!(id))}
  end

  defp page_title(:show), do: "Show Book of user"
  defp page_title(:edit), do: "Edit Book of user"
end
