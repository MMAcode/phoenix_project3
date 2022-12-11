defmodule Project3.JsonQuillTest do
  use Project3.DataCase

  alias Project3.JsonQuill

  describe "just_maps" do
    alias Project3.JsonQuill.JustMap

    import Project3.JsonQuillFixtures

    @invalid_attrs %{data: nil}

    test "list_just_maps/0 returns all just_maps" do
      just_map = just_map_fixture()
      assert JsonQuill.list_just_maps() == [just_map]
    end

    test "get_just_map!/1 returns the just_map with given id" do
      just_map = just_map_fixture()
      assert JsonQuill.get_just_map!(just_map.id) == just_map
    end

    test "create_just_map/1 with valid data creates a just_map" do
      valid_attrs = %{data: %{}}

      assert {:ok, %JustMap{} = just_map} = JsonQuill.create_just_map(valid_attrs)
      assert just_map.data == %{}
    end

    test "create_just_map/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = JsonQuill.create_just_map(@invalid_attrs)
    end

    test "update_just_map/2 with valid data updates the just_map" do
      just_map = just_map_fixture()
      update_attrs = %{data: %{}}

      assert {:ok, %JustMap{} = just_map} = JsonQuill.update_just_map(just_map, update_attrs)
      assert just_map.data == %{}
    end

    test "update_just_map/2 with invalid data returns error changeset" do
      just_map = just_map_fixture()
      assert {:error, %Ecto.Changeset{}} = JsonQuill.update_just_map(just_map, @invalid_attrs)
      assert just_map == JsonQuill.get_just_map!(just_map.id)
    end

    test "delete_just_map/1 deletes the just_map" do
      just_map = just_map_fixture()
      assert {:ok, %JustMap{}} = JsonQuill.delete_just_map(just_map)
      assert_raise Ecto.NoResultsError, fn -> JsonQuill.get_just_map!(just_map.id) end
    end

    test "change_just_map/1 returns a just_map changeset" do
      just_map = just_map_fixture()
      assert %Ecto.Changeset{} = JsonQuill.change_just_map(just_map)
    end
  end
end
