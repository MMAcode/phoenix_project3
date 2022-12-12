defmodule Project3.JsonQuill.JustMap do
  use Ecto.Schema
  import Ecto.Changeset

  schema "just_maps" do
    field :data, :map

    timestamps()
  end

  @doc false
  def changeset(just_map, attrs) do
    # x = %{"a" => "a"}
    # x = %{7 => 7}
    # y = "{7 => 7}"
    # y = "{}" works
    string= ~s({"status": "ok"})
    # x = Jason.encode!(y)
    {_, stringAsJson} = all  = Jason.decode(string)
    # dbg ["miro local stringAsJson is_map: ",all, is_map stringAsJson]
    # dbg string
    # dbg all
    # dbg stringAsJson
    # dbg(is_map(stringAsJson))

    # dbg ["miro attrs:", attrs]
    data = Map.get(attrs,"data")
    # dbg ["miro attrs.data is_map: ", is_map(data), "string.binary:", is_binary(data), "is nil:", is_nil(data)]
    if is_binary(data) do
      # dbg "data is string, converting to dataJ"
      {_, dataJ } = result = Jason.decode(data) |> dbg
      # dbg ["miro attr.data result after json decode: ", result]
      # dbg(["is result's dajaJ map?:", is_map(dataJ)])
    end





    # # MAIN section - convert text to map to save to db
    # data = Map.get(attrs,"data")

    # attrs = if is_binary(data) do
    #   {status, dataJ} = Jason.decode(data)
    #   if status == :ok do
    #     Map.replace!(attrs, "data", dataJ)
    #   else
    #     attrs
    #   end
    # else
    #   attrs
    # end

    # IO.inspect(Process.info(self(), :current_stacktrace), label: "STACKTRACE")

    just_map
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
