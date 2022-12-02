defmodule Project3Web.UserLive.Index do
  use Project3Web, :live_view

  alias Project3.Accounts
  alias Project3.Accounts.User
  # alias Project3.PubSubs.UserPS

  @impl true
  def mount(_params, _session, socket) do
    # if connected?(socket), do: UserPS.subscribe()
    if connected?(socket) do
      # r = Phoenix.PubSub.subscribe(Project3.PubSub, Constants.userPS_users())
      r = Phoenix.PubSub.subscribe(Project3.PubSub, "users")
      dbg(Phoenix.PubSub.node_name(Project3.PubSub))
      dbg(["miro - result of subscribing: ", r])
      dbg(["miroProcess1", self(), Process.info(self(), :messages)])
    end
    {:ok, assign(socket, :users, list_users())}
  end

  @impl true
  def handle_info({:userAdded, user}, socket) do
    dbg(["miro - follwoing message received1: ", user])
    {:noreply, socket}
    # case message do
    #   {:userAdded, user} ->
    #     {:noreply, assign(socket, :users, [user | socket.assigns.users])}
    # end
  end

    @impl true
  def handle_info(message, socket) do
    dbg(["miro - follwoing message received2: ", message])
    {:noreply, socket}
    # case message do
    #   {:userAdded, user} ->
    #     {:noreply, assign(socket, :users, [user | socket.assigns.users])}
    # end
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, Accounts.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = Accounts.get_user!(id)
    {:ok, _} = Accounts.delete_user(user)

    {:noreply, assign(socket, :users, list_users())}
  end

  defp list_users do
    Accounts.list_users()
  end
end
