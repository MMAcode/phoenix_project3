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
    <%!-- <div id="editor" phx-hook="TextEditor" phx-target={"xxx"} /> --%>
    <div id="editor" phx-hook="TextEditor"/>
    <.button phx-click="here">here</.button>
    """
  end

  def handle_event("text-editor", %{"text_content" => content}, socket) do
    dbg [content]
    {:noreply, socket}
  end


  def handle_event("here", _params, socket) do
    dbg "miro here"

    {:noreply, socket}
  end

  @impl true
  def handle_event("TextEditor", _, socket) do
    dbg(["miro 'TextEditor' triggered"])
    {:noreply, assign(socket, :is_editing, true)}
  end


end
