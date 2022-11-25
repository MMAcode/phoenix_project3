defmodule Project3Web.LiveFunctionalComponentsMiro do
  import Project3Web.CoreComponents
  use Project3Web, :live_view

  def render(assigns) do
    ~H"""
    <div class="bg-gray-200 p-3 m-3">
      <h3 class="text-center">Buttons and styles (inline)</h3>
      <%!-- <%= CoreComponents.render(:hello, name: "World") %> --%>
      <%!-- <TCC.button>ahoj</TCC.button> --%>
      <div>normal button:</div>
      <button
        class=" p-2 rounded bg-red-500 transition-colors hover:bg-sky-700 duration-500"
        phx-click="click"
      >
        Click me!
      </button>
      <button>ahoj</button>

      <div>tailwind buttons:</div>
      <.button class="mmB2">ahoj</.button>

      <h3>May there be a LIGHT</h3>
      <.button phx-click="switch">light switch</.button>
      <p>Light is <%= if @light, do: "on", else: "off" %></p>
      <%!-- <div style={"background-color:yellow; transition:1s; width: #{light_to_width(@light)}"}> --%>
      <div style={"background-color:yellow; transition:1s; width: #{@light_intensity}%"}>
        <%!-- light beam (<%=light_to_width(@light)%>) --%> light beam (<%= @light_intensity %>)
      </div>
    </div>
    """
  end

    # BUTTONS:
  def handle_event("click", _params, socket) do
    IO.puts("Clicked!")
    {:noreply, socket}
  end

  def handle_event("switch", _eData, socket) do
    nr = Enum.random(1..100)
    dbg(nr)
    socket = assign(socket, light: !socket.assigns.light, light_intensity: Enum.random(1..100))
    # socket = assign(socket, light: !socket.assigns.light, randomNumber: Enum.random(1..100))
    # socket = assign(socket, light: !socket.assigns.light, light_intensity: 22)
    # socket = assign(socket, :light_intensity, 22)
    {:noreply, socket}
  end

  defp light_to_width(light) do
    if light, do: "100%", else: "0%"
  end

end
