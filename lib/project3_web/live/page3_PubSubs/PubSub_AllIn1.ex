defmodule Project3Web.PubSubPage.PubSub_AllIn1 do
  use Project3Web, :live_view
  @impl true
  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(Project3.PubSub, "counterAll")
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def handle_info({_from, action}=message, socket) do
    dbg(["miro - follwoing message received in AllIn1: ", message, socket.assigns.counter])
    {:noreply, assign(socket, :counter, action.(socket.assigns.counter))}
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
    Phoenix.PubSub.broadcast(Project3.PubSub, "counterAll", {:PS1, &(&1 + 1)})
    {:noreply, socket}
  end

  def handle_event("dec", _params, socket) do
    Phoenix.PubSub.broadcast(Project3.PubSub, "counterAll", {:PS1, &(&1 - 1)})
    {:noreply, socket}
  end
end
