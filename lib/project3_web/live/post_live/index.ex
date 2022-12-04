defmodule Project3Web.PostLive.Index do
  use Project3Web, :live_view

  alias Project3.Blog
  alias Project3.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :blog_posts, list_blog_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Blog posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :blog_posts, list_blog_posts())}
  end

  defp list_blog_posts do
    Blog.list_blog_posts()
  end
end
