defmodule Customers.Repo do
  use Ecto.Repo,
    otp_app: :day8_csv,
    adapter: Ecto.Adapters.Postgres
end
