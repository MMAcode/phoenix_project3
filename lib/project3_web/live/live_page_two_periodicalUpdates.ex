defmodule Project3Web.LivePageTwoPeriodicalUpdates do
  use Project3Web, :live_view

  # @impl Phoenix.LiveView
  def mount(params, session, socket) do
    dbg("hihi")
    {:ok, socket}
  end

  # @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div>
      <h3>Periodical updates</h3>
      <div>
      </div>
    </div>
    """
  end

end
