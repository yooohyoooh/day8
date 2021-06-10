defmodule Customers.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :number, :string
      add :name, :string
      add :score, :string
      add :address, :string
    end
  end
end
