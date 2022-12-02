defmodule Project3Web.PubSubPage.PubSub_Send do
  use Project3Web, :live_view
  @impl true
  def mount(_params, _session, socket) do
    # dbg(Phoenix.PubSub.subscribe(Project3.PubSub, "counter"))
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def handle_info({:PS2, _}=message, socket) do
    dbg(["miro - follwoing message received: ", message])
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Page 3</h1>
    <h2>PubSubs</h2>
    <h3>PubSub_Send</h3>
    <p>Counter: <%= @counter %></p>
    <button phx-click="inc">Increment</button>
    <button phx-click="dec">Decrement</button>
    """
  end

  @impl true
  def handle_event("inc", _params, socket) do
    dbg(Phoenix.PubSub.broadcast(Project3.PubSub, "counter", {:PS1, :inc}))
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  def handle_event("dec", _params, socket) do
    dbg(Phoenix.PubSub.broadcast(Project3.PubSub, "counter", {:PS1, :dec}))
    {:noreply, assign(socket, :counter, socket.assigns.counter - 1)}
  end
end
