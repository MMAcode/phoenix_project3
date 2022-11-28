defmodule Project3Web.LiveFormsMiro do
  import Project3Web.CoreComponents
  use Project3Web, :live_view

  # def render(assigns) do
  #   ~H"""
  #   <%!-- <div>
  #     <h3>Form (miro)</h3>
  #     <form phx-submit="submit">
  #       <input type="text" phx-value="name" />
  #       <input type="submit" value="Submit" />
  #     </form>
  #   </div> --%>
  #   """
  # end

  def tailwind_form(assigns) do
    ~H"""
    <div class="bg-green-200 p-3 m-3">
      <h3>Form (tailwind)</h3>
      <%!-- <form phx-submit="submit_name" > --%>
      <form phx-change="formUpdated">
        <%!-- <input phx-change="update_name" type="text" phx-value="name" placeholder="Your name please..." value={@name} /> --%>
        <input name="nameInput" value={@name} type="text" placeholder="Your name please..." />
        <span>received name: <%= @name %></span>

        <h4>light slider:</h4>
        <input phx-change="updateMe" name="light_slider" value={@light_intensity} type="range" />
        <%!-- <.button type="submit">Submit</.button> --%>

        <div style={"background-color:yellow; transition:1s; width: #{@light_intensity}%"}>
          light beam (<%= @light_intensity %>)
        </div>
      </form>
    </div>
    """
  end


end
