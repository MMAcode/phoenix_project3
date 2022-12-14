defmodule Project3Web.Page4.Quill do
  use Project3Web, :live_view

  @impl true
  def mount(_params, _session, socket) do
    case connected?(socket) do
      true -> connected_mount(socket)
      false -> {:ok, assign(socket, page: "loading", just_maps: [], quill: nil, count: 0)}
    end
  end

  def connected_mount(socket) do
    quills = prep_list(list_quills())
    push_event(socket, "miroFromServer", %{savedQuills: quills})

    {:ok,
     assign(socket, just_maps: list_quills(), quill: nil, count: 0, page: "connected")
    #  |> push_event("miroFromServer", %{savedQuills: nil})}
     |> push_event("miroFromServer", %{savedQuills: quills})}
  end

  @impl true
  def render(%{page: "loading"} = assigns) do
    ~H"""
    <p>Loading...</p>
    """
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
    <% end %>

    <%!-- <script> --%>
    <%!-- miroPost = <%= Jason.encode!(getQuill(@just_maps, 2)) %>; --%>
    <%!-- </script> --%>
    <h3>Add new:</h3>
    <div id="editorWrapper" phx-update="ignore">
      <div id="editor" phx-hook="TextEditor" />
    </div>
    <.button phx-click="save" phx-disable-with="Saving...">Save</.button>
    <.button phx-click="inc">inc <%= @count %></.button>
    """
  end

  @impl true
  def handle_event("inc", _, socket) do
    {:noreply,
     assign(socket, count: socket.assigns.count + 1)
     |> push_event("miroFromServer", %{savedQuills: nil})}
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
    dbg("saving quill")

    case Project3.JsonQuill.create_just_map(%{data: socket.assigns.quill}) do
      {:ok, just_map} ->
        dbg("seems like saved")

        {
          :noreply,
          socket
          |> put_flash(:info, "Just map created successfully")
          #  |> push_navigate(to: socket.assigns.navigate)
          # |> push_event("miroFromServer", %{id: "miroId"})
          # |> fn x -> dbg(["miro 125", x], printable_limit: :infinity, limit: :infinity); x end.()
          |> (fn x ->
                dbg(["miro 1256jm", just_map.data], printable_limit: :infinity, limit: :infinity)
                x
              end).()
          |> push_event("miroFromServer", %{savedQuills: just_map.data})
        }

      # {:noreply, push_event(socket, "highlight", %{id: "item-#{item.id}"})}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp list_quills do
    dbg("calling db")
    Project3.JsonQuill.list_just_maps()
  end

  defp prep_list(list) do
    list
    |> Enum.map(fn row -> Jason.encode!(row.data) end)
  end

  defp getQuill(listX, id) do
    listX
    |> Enum.filter(&(&1.id == id))
    |> Enum.map(fn row -> row.data end)
  end
end
