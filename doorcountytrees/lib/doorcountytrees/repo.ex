defmodule Doorcountytrees.Repo do
  use Ecto.Repo,
    otp_app: :doorcountytrees,
    adapter: Ecto.Adapters.Postgres
end
