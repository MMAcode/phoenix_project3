defmodule Project3.Repo do
  use Ecto.Repo,
    otp_app: :project3,
    adapter: Ecto.Adapters.Postgres
end
