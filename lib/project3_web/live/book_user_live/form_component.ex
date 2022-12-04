defmodule Project3Web.BookUserLive.FormComponent do
  use Project3Web, :live_component

  alias Project3.Link

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage book_user records in your database.</:subtitle>
      </.header>

      <.simple_form
        :let={f}
        for={@changeset}
        id="book_user-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={{f, :name}} type="text" label="name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Book user</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{book_user: book_user} = assigns, socket) do
    changeset = Link.change_book_user(book_user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"book_user" => book_user_params}, socket) do
    changeset =
      socket.assigns.book_user
      |> Link.change_book_user(book_user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"book_user" => book_user_params}, socket) do
    save_book_user(socket, socket.assigns.action, book_user_params)
  end

  defp save_book_user(socket, :edit, book_user_params) do
    case Link.update_book_user(socket.assigns.book_user, book_user_params) do
      {:ok, _book_user} ->
        {:noreply,
         socket
         |> put_flash(:info, "Book user updated successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_book_user(socket, :new, book_user_params) do
    case Link.create_book_user(book_user_params) do
      {:ok, _book_user} ->
        {:noreply,
         socket
         |> put_flash(:info, "Book user created successfully")
         |> push_navigate(to: socket.assigns.navigate)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
