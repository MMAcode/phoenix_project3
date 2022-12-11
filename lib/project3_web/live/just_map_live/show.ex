defmodule Project3Web.JustMapLive.Show do
  use Project3Web, :live_view

  alias Project3.JsonQuill

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:just_map, JsonQuill.get_just_map!(id))}
  end

  defp page_title(:show), do: "Show Just map"
  defp page_title(:edit), do: "Edit Just map"
end
