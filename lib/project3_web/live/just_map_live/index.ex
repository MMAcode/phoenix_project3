defmodule Project3Web.JustMapLive.Index do
  use Project3Web, :live_view

  alias Project3.JsonQuill
  alias Project3.JsonQuill.JustMap

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :just_maps, list_just_maps())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Just map")
    |> assign(:just_map, JsonQuill.get_just_map!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Just map")
    |> assign(:just_map, %JustMap{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Just maps")
    |> assign(:just_map, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    just_map = JsonQuill.get_just_map!(id)
    {:ok, _} = JsonQuill.delete_just_map(just_map)

    {:noreply, assign(socket, :just_maps, list_just_maps())}
  end

  defp list_just_maps do
    JsonQuill.list_just_maps()
  end
end
