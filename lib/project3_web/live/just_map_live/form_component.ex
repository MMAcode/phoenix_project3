defmodule Project3Web.JustMapLive.FormComponent do
  use Project3Web, :live_component

  alias Project3.JsonQuill

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage just_map records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="just_map-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :data}} type="text" label="data" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Just map</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{just_map: just_map} = assigns, socket) do
    changeset = JsonQuill.change_just_map(just_map)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"just_map" => just_map_params}, socket) do
    changeset =
      socket.assigns.just_map
      |> JsonQuill.change_just_map(just_map_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"just_map" => just_map_params}, socket) do
    save_just_map(socket, socket.assigns.action, just_map_params)
  end

  defp save_just_map(socket, :edit, just_map_params) do
    case JsonQuill.update_just_map(socket.assigns.just_map, just_map_params) do
      {:ok, _just_map} ->
        {:noreply,
         socket
         |> put_flash(:info, "Just map updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_just_map(socket, :new, just_map_params) do
    case JsonQuill.create_just_map(just_map_params) do
      {:ok, _just_map} ->
        {:noreply,
         socket
         |> put_flash(:info, "Just map created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
