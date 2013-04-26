require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host" do
    assert_difference('Host.count') do
      post :create, host: { iogroup: @host.iogroup, ip: @host.ip, location: @host.location, name: @host.name, opsystem: @host.opsystem, primary_sadmin_id: @host.primary_sadmin_id, purpose: @host.purpose, secondary_sadmin_id: @host.secondary_sadmin_id, type: @host.type }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    get :show, id: @host
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host
    assert_response :success
  end

  test "should update host" do
    put :update, id: @host, host: { iogroup: @host.iogroup, ip: @host.ip, location: @host.location, name: @host.name, opsystem: @host.opsystem, primary_sadmin_id: @host.primary_sadmin_id, purpose: @host.purpose, secondary_sadmin_id: @host.secondary_sadmin_id, type: @host.type }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
end
