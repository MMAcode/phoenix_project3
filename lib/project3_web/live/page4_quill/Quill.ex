defmodule Project3Web.Page4.Quill do
  use Project3Web, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :just_maps, list_quills())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
    <h1>Page 4</h1>
    <h2>Quill</h2>
    <%!-- <div id="editor" phx-hook="TextEditor" phx-target={@myself} /> --%>
    <h3>Existing:</h3>
    <%= for row <- prep_list(@just_maps) do %>
      <div><%= row %></div>
      <div>hi</div>
    <% end %>

    <h3>Add new:</h3>
    <div id="editor" phx-hook="TextEditor" />
    <.button phx-click="save" phx-disable-with="Saving...">Save</.button>
    """
  end

  @impl true
  def handle_event("text-editor", %{"text_content" => content}, socket) do
    dbg(content)
    {:noreply, assign(socket, quill: content)}
  end

  def handle_event("save", _params, socket) do
    dbg(["handle save", socket.assigns.quill])
    save_quill(socket)
  end

  defp save_quill(socket) do
    case Project3.JsonQuill.create_just_map(%{data: socket.assigns.quill}) do
      {:ok, _just_map} ->
        {
          :noreply,
          socket
          |> put_flash(:info, "Just map created successfully")
          #  |> push_navigate(to: socket.assigns.navigate)
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp list_quills do
    Project3.JsonQuill.list_just_maps() |> dbg
  end

  defp prep_list (list) do
    list
    |> Enum.map(fn row -> row.data end)
    |> dbg
    |> Enum.map(fn data -> Jason.encode!(data) end)
    |> dbg
    # [1,2,3]
  end
end
