defmodule Project3Web.JustMapLiveTest do
  use Project3Web.ConnCase

  import Phoenix.LiveViewTest
  import Project3.JsonQuillFixtures

  @create_attrs %{data: %{}}
  @update_attrs %{data: %{}}
  @invalid_attrs %{data: nil}

  defp create_just_map(_) do
    just_map = just_map_fixture()
    %{just_map: just_map}
  end

  describe "Index" do
    setup [:create_just_map]

    test "lists all just_maps", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/just_maps")

      assert html =~ "Listing Just maps"
    end

    test "saves new just_map", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/just_maps")

      assert index_live |> element("a", "New Just map") |> render_click() =~
               "New Just map"

      assert_patch(index_live, ~p"/just_maps/new")

      assert index_live
             |> form("#just_map-form", just_map: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#just_map-form", just_map: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/just_maps")

      assert html =~ "Just map created successfully"
    end

    test "updates just_map in listing", %{conn: conn, just_map: just_map} do
      {:ok, index_live, _html} = live(conn, ~p"/just_maps")

      assert index_live |> element("#just_maps-#{just_map.id} a", "Edit") |> render_click() =~
               "Edit Just map"

      assert_patch(index_live, ~p"/just_maps/#{just_map}/edit")

      assert index_live
             |> form("#just_map-form", just_map: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#just_map-form", just_map: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/just_maps")

      assert html =~ "Just map updated successfully"
    end

    test "deletes just_map in listing", %{conn: conn, just_map: just_map} do
      {:ok, index_live, _html} = live(conn, ~p"/just_maps")

      assert index_live |> element("#just_maps-#{just_map.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#just_map-#{just_map.id}")
    end
  end

  describe "Show" do
    setup [:create_just_map]

    test "displays just_map", %{conn: conn, just_map: just_map} do
      {:ok, _show_live, html} = live(conn, ~p"/just_maps/#{just_map}")

      assert html =~ "Show Just map"
    end

    test "updates just_map within modal", %{conn: conn, just_map: just_map} do
      {:ok, show_live, _html} = live(conn, ~p"/just_maps/#{just_map}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Just map"

      assert_patch(show_live, ~p"/just_maps/#{just_map}/show/edit")

      assert show_live
             |> form("#just_map-form", just_map: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#just_map-form", just_map: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, ~p"/just_maps/#{just_map}")

      assert html =~ "Just map updated successfully"
    end
  end
end
