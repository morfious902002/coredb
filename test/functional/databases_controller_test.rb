require 'test_helper'

class DatabasesControllerTest < ActionController::TestCase
  setup do
    @database = databases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:databases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create database" do
    assert_difference('Database.count') do
      post :create, database: { dbcreated_on: @database.dbcreated_on, dbmethod: @database.dbmethod, host_id: @database.host_id, name: @database.name, port: @database.port, primary_dba_id: @database.primary_dba_id, secondary_dba_id: @database.secondary_dba_id, server_id: @database.server_id, server_type: @database.server_type, unique_hash: @database.unique_hash, version: @database.version }
    end

    assert_redirected_to database_path(assigns(:database))
  end

  test "should show database" do
    get :show, id: @database
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @database
    assert_response :success
  end

  test "should update database" do
    put :update, id: @database, database: { dbcreated_on: @database.dbcreated_on, dbmethod: @database.dbmethod, host_id: @database.host_id, name: @database.name, port: @database.port, primary_dba_id: @database.primary_dba_id, secondary_dba_id: @database.secondary_dba_id, server_id: @database.server_id, server_type: @database.server_type, unique_hash: @database.unique_hash, version: @database.version }
    assert_redirected_to database_path(assigns(:database))
  end

  test "should destroy database" do
    assert_difference('Database.count', -1) do
      delete :destroy, id: @database
    end

    assert_redirected_to databases_path
  end
end
