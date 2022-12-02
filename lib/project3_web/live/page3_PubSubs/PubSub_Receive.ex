defmodule Project3Web.PubSubPage.PubSub_Receive do
  use Project3Web, :live_view
  @impl true
  def mount(_params, _session, socket) do
    dbg(Phoenix.PubSub.subscribe(Project3.PubSub, "counter"))
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def handle_info({:PS1, act} = message, socket) do
    dbg(["miro - follwoing message received in PubSub_Receive: ", message])
    {:noreply, assign(socket, :counter, socket.assigns.counter + (if act == :inc, do: 1, else: -1))}
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
    # dbg(Phoenix.PubSub.broadcast(Project3.PubSub, "counter", {:PS2, :inc}))
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  def handle_event("dec", _params, socket) do
    # dbg(Phoenix.PubSub.broadcast(Project3.PubSub, "counter", {:PS2, :decr}))
    {:noreply, assign(socket, :counter, socket.assigns.counter - 1)}
  end
end
