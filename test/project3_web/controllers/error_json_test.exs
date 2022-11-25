defmodule Project3Web.ErrorJSONTest do
  use Project3Web.ConnCase, async: true

  test "renders 404" do
    assert Project3Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Project3Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
