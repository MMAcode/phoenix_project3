defmodule Project3Web.Page4.Quill do
  use Project3Web, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <h1>Page 4</h1>
    <h2>Quill</h2>
    <%!-- <div id="editor" phx-hook="TextEditor" phx-target={@myself} /> --%>
    <div id="editor" phx-hook="TextEditor"/>
    """
  end

  def handle_event("text-editor", %{"text_content" => content}, socket) do
    dbg [content]
    {:noreply, socket}
  end
end
