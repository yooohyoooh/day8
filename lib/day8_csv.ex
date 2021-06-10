defmodule Day8Csv do
  def main do
    file_name = "CUSTOMER.csv"
    list = Customer.read_file(file_name)
    insertList(list)
  end

  def insertList(list) do
    customer = %Customers.Customer{}
    Enum.map(list, fn x ->
      Customers.Customer.changeset(customer, x)
    end)
  end

end
