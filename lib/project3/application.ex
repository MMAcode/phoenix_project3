defmodule Project3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Project3Web.Telemetry,
      # Start the Ecto repository
      Project3.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Project3.PubSub},
      # Start Finch
      {Finch, name: Project3.Finch},
      # Start the Endpoint (http/https)
      Project3Web.Endpoint
      # Start a worker by calling: Project3.Worker.start_link(arg)
      # {Project3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Project3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Project3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
