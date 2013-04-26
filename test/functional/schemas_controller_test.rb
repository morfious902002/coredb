require 'test_helper'

class SchemasControllerTest < ActionController::TestCase
  setup do
    @schema = schemas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schema" do
    assert_difference('Schema.count') do
      post :create, schema: { application_id: @schema.application_id, database_id: @schema.database_id, name: @schema.name, size: @schema.size }
    end

    assert_redirected_to schema_path(assigns(:schema))
  end

  test "should show schema" do
    get :show, id: @schema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schema
    assert_response :success
  end

  test "should update schema" do
    put :update, id: @schema, schema: { application_id: @schema.application_id, database_id: @schema.database_id, name: @schema.name, size: @schema.size }
    assert_redirected_to schema_path(assigns(:schema))
  end

  test "should destroy schema" do
    assert_difference('Schema.count', -1) do
      delete :destroy, id: @schema
    end

    assert_redirected_to schemas_path
  end
end
