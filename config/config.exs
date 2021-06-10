import Config

config :customers, Customers.Repo,
  database: "customers_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
config :customers, ecto_repos: [Customers.Repo]
