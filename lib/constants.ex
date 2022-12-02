defmodule Constants do
  # def userPS_users, do: "users"
  # def counterAll_PS, do: "counterAll"

  def pubsubTopic() do
    %{
      users: "users",
      counterAll: "counterAll"
    }
  end
end
