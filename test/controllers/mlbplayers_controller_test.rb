require 'test_helper'

class MlbplayersControllerTest < ActionController::TestCase
  setup do
    @mlbplayer = mlbplayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mlbplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mlbplayer" do
    assert_difference('Mlbplayer.count') do
      post :create, mlbplayer: { avgpoints: @mlbplayer.avgpoints, battingpos: @mlbplayer.battingpos, name: @mlbplayer.name, position: @mlbplayer.position, salary: @mlbplayer.salary, team: @mlbplayer.team, value: @mlbplayer.value }
    end

    assert_redirected_to mlbplayer_path(assigns(:mlbplayer))
  end

  test "should show mlbplayer" do
    get :show, id: @mlbplayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mlbplayer
    assert_response :success
  end

  test "should update mlbplayer" do
    patch :update, id: @mlbplayer, mlbplayer: { avgpoints: @mlbplayer.avgpoints, battingpos: @mlbplayer.battingpos, name: @mlbplayer.name, position: @mlbplayer.position, salary: @mlbplayer.salary, team: @mlbplayer.team, value: @mlbplayer.value }
    assert_redirected_to mlbplayer_path(assigns(:mlbplayer))
  end

  test "should destroy mlbplayer" do
    assert_difference('Mlbplayer.count', -1) do
      delete :destroy, id: @mlbplayer
    end

    assert_redirected_to mlbplayers_path
  end
end
