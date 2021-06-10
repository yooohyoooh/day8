defmodule Customer do
  @moduledoc"""
  2班（浅木、遠藤、増中）が作成
  """

  @doc"""
  フォーマット1
  ## Example
      iex> Customer.read_file
      %{
        "CUS01060" => ["○○○306", "13",
         "静岡県"],
        "CUS01073" => ["○○○312", "8",
         "千葉県"],
         ...
      }
  """
  def read_file do
    #ファイルデータをdataに格納、レコードごとに分割してリスト化（不要な先頭レコード削除）
    {_status, data} = File.read("CUSTOMER.csv")
    data_list = String.split(data, "\r\n")
    data_list = tl(data_list)


    #レコードをさらに要素ごとに分割してマップ化したものをリストに格納
    list =
    for i <- data_list do
      #レコードを分割してリスト化
      data = String.split(i, ",")
      #リスト化したレコードのheadをキー、tail（リスト）を値としてマップ化
      %{hd(data) => tl(data)}
    end


    #[%{},%{}...]となっているので、各マップを結合して1つのマップにする
    #Enum.reduce(要素を取り出すリスト、初期値、関数)
    #fn x(リストから取り出す要素), acc(それまでの要素をmergeしたもの)　-> xをaccに結合する
    Enum.reduce(list, %{}, fn x, acc -> Map.merge(x, acc) end)
  end

  @doc"""
  フォーマット2
  ## Example
      iex> Customer.read_file2
      [
        %{
          "与信スコア" => "28",
          "取引先名称" => "○○○01株式会社",
          "取引先番号" => "CUS00002",
          "都道府県" => "新潟県"
        },
        ...
      ]
  """
  def read_file(file_name) do
    #ファイルデータをdataに格納、レコードごとに分割してリスト化
    {_status, data} = File.read(file_name)
    data_list = String.split(data, "\r\n")

    #head：["取引先番号,取引先名称...""] tail：それ以降の各レコードが入ったリスト
    head = hd(data_list)
    tail = tl(data_list)

    #headを分割してリスト化
    keys = String.split(head,",")

    for i <- tail do
      data = String.split(i, ",")

      list =
        for j <- 0..(length(keys) - 1) do
          %{Enum.at(keys, j) => Enum.at(data, j)}
        end
      Enum.reduce(list, %{}, fn x, acc -> Map.merge(x, acc) end)

    end
  end
end
