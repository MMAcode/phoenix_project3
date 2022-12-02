defmodule Project3.PubSubs.UserPS do
  def subscribe do
    Phoenix.PubSub.subscribe(Project3.PubSub, Constants.userPS_users())
  end
end
