defmodule Project3Web.LivePageOne_ButtonsStylesForms do
  # alias Project3Web.CoreComponents, as: TCC
  # alias Project3Web.CoreComponents
  alias Project3Web.LiveFunctionalComponentsMiro
  alias Project3Web.LiveFormsMiro
  use Project3Web, :live_view

  defp assignProps(socket) do
    assign(socket, light: false, light_intensity: Enum.random(1..100), name: "Miro")
  end

  def mount(_params, _session, socket) do
    socket = assignProps(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Page 1</h1>
    <%= LiveFunctionalComponentsMiro.render(assigns) %>
    <%!-- <%= LiveFormsMiro.render(assigns) %> --%>
    <%= LiveFormsMiro.tailwind_form(assigns) %>
    """
  end

  # FORMS:
  # def handle_event("submit_name", %{"name" => name}, socket) do
  #   IO.puts("Submitted name: #{name}")
  #   {:noreply, socket}
  # end
  #   def handle_event("submit_name", x, socket) do
  #   # IO.puts("Submitted name: #{x}")
  #   dbg(["mirecek", x])
  #   {:noreply, socket}
  # end

  def handle_event("formUpdated", %{"nameInput" => newName}, socket), do:    {:noreply, assign(socket, name: newName)}
  def handle_event("sliderUpdated", %{"light_slider" => newValue}, socket) do
    dbg(["light_slider", newValue])
        {:noreply, assign(socket, light_intensity: newValue)}
  end




    # BUTTONS:
  def handle_event("click", params, socket), do: LiveFunctionalComponentsMiro.handle_event("click", params, socket)
  def handle_event("switch", params, socket), do: LiveFunctionalComponentsMiro.handle_event("switch", params, socket)



end
