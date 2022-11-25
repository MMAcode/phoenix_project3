defmodule Project3Web.LivePageOne do
  # alias Project3Web.CoreComponents, as: TCC
  import Project3Web.CoreComponents
  use Project3Web, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, light: false, random_number: Enum.random(1..100))
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <%= buttons_and_styling(assigns)%>
    <%= form_miro(assigns)%>
    <%= tailwind_form(assigns)%>
    """
  end

  def handle_event("click", _params, socket) do
    IO.puts("Clicked!")
    {:noreply, socket}
  end

  def handle_event("switch", _eData, socket) do
    nr = Enum.random(1..100)
    dbg(nr)
    socket = assign(socket, light: !socket.assigns.light, random_number: Enum.random(1..100))
    # socket = assign(socket, light: !socket.assigns.light, randomNumber: Enum.random(1..100))
    # socket = assign(socket, light: !socket.assigns.light, random_number: 22)
    # socket = assign(socket, :random_number, 22)
    {:noreply, socket}
  end

  def light_to_width(light) do
    if light, do: "100%", else: "0%"
  end

  def buttons_and_styling(assigns) do
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
      <div style={"background-color:yellow; transition:1s; width: #{@random_number}%"}>
        <%!-- light beam (<%=light_to_width(@light)%>) --%> light beam (<%= @random_number %>)
      </div>
    </div>
    """
  end

  def form_miro(assigns) do
    ~H"""
    <div>
      <h3>Form (miro)</h3>
      <form phx-submit="submit">
        <input type="text" phx-value="name" />
        <input type="submit" value="Submit" />
      </form>
    </div>
    """
  end

    def tailwind_form(assigns) do
    ~H"""
    <div class="bg-green-200 p-3 m-3">
      <h3>Form (tailwind)</h3>
      <form phx-submit="submit">
        <input type="text" phx-value="name" />
        <input type="submit" value="Submit" />
      </form>
    </div>
    """
  end
end
