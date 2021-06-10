defmodule Customers.Customer do
  use Ecto.Schema
  schema "customers" do
    field :number, :string
    field :name, :string
    field :score, :string
    field :address, :string
  end

  def changeset(customer, params \\ %{}) do
    customer
      |> Ecto.Changeset.cast(params, [:number, :name, :score, :address])
      |> Ecto.Changeset.validate_required([:number, :name, :score, :address])
  end
end
