defmodule Day8Csv do
  def main do
    "CUSTOMER.csv"
    |> Customer.read_file()
    |> insertData()
  end

  def insertData(data) do
    customer = %Customers.Customer{}
    Enum.each(data, fn x ->
      Customers.Customer.changeset(customer, x)
      |> Customers.Repo.insert()
    end)
  end

end
