require 'test_helper'

class SystemadminsControllerTest < ActionController::TestCase
  setup do
    @systemadmin = systemadmins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:systemadmins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create systemadmin" do
    assert_difference('Systemadmin.count') do
      post :create, systemadmin: { email: @systemadmin.email, location: @systemadmin.location, name: @systemadmin.name, netid: @systemadmin.netid, priphone: @systemadmin.priphone, secphone: @systemadmin.secphone }
    end

    assert_redirected_to systemadmin_path(assigns(:systemadmin))
  end

  test "should show systemadmin" do
    get :show, id: @systemadmin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @systemadmin
    assert_response :success
  end

  test "should update systemadmin" do
    put :update, id: @systemadmin, systemadmin: { email: @systemadmin.email, location: @systemadmin.location, name: @systemadmin.name, netid: @systemadmin.netid, priphone: @systemadmin.priphone, secphone: @systemadmin.secphone }
    assert_redirected_to systemadmin_path(assigns(:systemadmin))
  end

  test "should destroy systemadmin" do
    assert_difference('Systemadmin.count', -1) do
      delete :destroy, id: @systemadmin
    end

    assert_redirected_to systemadmins_path
  end
end
