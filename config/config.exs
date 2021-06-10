import Config

config :day8_csv, Customers.Repo,
  database: "customers_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
config :day8_csv, ecto_repos: [Customers.Repo]
