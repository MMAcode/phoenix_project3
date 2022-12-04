defmodule Project3Web.Router do
  alias Project3Web.Page3_PubSubs
  use Project3Web, :router

  import Project3Web.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Project3Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Project3Web do
    pipe_through :browser
    live "/", LivePageTwoPeriodicalUpdates
    live "/one", LivePageOne_ButtonsStylesForms

    scope "3", PubSubPage do
      live "a", PubSub_Send
      live "b", PubSub_Receive
      live "all1", PubSub_AllIn1
      live "all2", PubSub_AllIn2
    end

    scope "/books", BookLive do
      live "/", Index, :index
      live "/new", Index, :new
      live "/:id/edit", Index, :edit
      live "/:id", Show, :show
      live "/:id/show/edit", Show, :edit
    end

    live "/blog_posts", PostLive.Index, :index
    live "/blog_posts/new", PostLive.Index, :new
    live "/blog_posts/:id/edit", PostLive.Index, :edit
    live "/blog_posts/:id", PostLive.Show, :show
    live "/blog_posts/:id/show/edit", PostLive.Show, :edit

    get "/archive", PageController, :home

    # generated by: mix phx.gen.live Accounts User users name:string age:integer
    live "/users", UserLive.Index, :index
    live "/users/new", UserLive.Index, :new
    live "/users/:id/edit", UserLive.Index, :edit

    live "/users/:id", UserLive.Show, :show
    live "/users/:id/show/edit", UserLive.Show, :edit

    # LINKS:
    live "/book_users", BookUserLive.Index, :index
    live "/book_users/new", BookUserLive.Index, :new
    live "/book_users/:id/edit", BookUserLive.Index, :edit
    live "/book_users/:id", BookUserLive.Show, :show
    live "/book_users/:id/show/edit", BookUserLive.Show, :edit

    live "/books_of_users", BookOfUserLive.Index, :index
    live "/books_of_users/new", BookOfUserLive.Index, :new
    live "/books_of_users/:id/edit", BookOfUserLive.Index, :edit
    live "/books_of_users/:id", BookOfUserLive.Show, :show
    live "/books_of_users/:id/show/edit", BookOfUserLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", Project3Web do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:project3, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: Project3Web.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", Project3Web do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{Project3Web.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", Project3Web do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{Project3Web.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", Project3Web do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{Project3Web.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
