require 'test_helper'

class DbadminsControllerTest < ActionController::TestCase
  setup do
    @dbadmin = dbadmins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dbadmins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dbadmin" do
    assert_difference('Dbadmin.count') do
      post :create, dbadmin: { email: @dbadmin.email, location: @dbadmin.location, name: @dbadmin.name, netid: @dbadmin.netid, priphone: @dbadmin.priphone, secphone: @dbadmin.secphone }
    end

    assert_redirected_to dbadmin_path(assigns(:dbadmin))
  end

  test "should show dbadmin" do
    get :show, id: @dbadmin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dbadmin
    assert_response :success
  end

  test "should update dbadmin" do
    put :update, id: @dbadmin, dbadmin: { email: @dbadmin.email, location: @dbadmin.location, name: @dbadmin.name, netid: @dbadmin.netid, priphone: @dbadmin.priphone, secphone: @dbadmin.secphone }
    assert_redirected_to dbadmin_path(assigns(:dbadmin))
  end

  test "should destroy dbadmin" do
    assert_difference('Dbadmin.count', -1) do
      delete :destroy, id: @dbadmin
    end

    assert_redirected_to dbadmins_path
  end
end
