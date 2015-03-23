require 'test_helper'

class NbaplayersControllerTest < ActionController::TestCase
  setup do
    @nbaplayer = nbaplayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nbaplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nbaplayer" do
    assert_difference('Nbaplayer.count') do
      post :create, nbaplayer: { avgfanduelpoints: @nbaplayer.avgfanduelpoints, is_starting_lineup: @nbaplayer.is_starting_lineup, name: @nbaplayer.name, position: @nbaplayer.position, team: @nbaplayer.team }
    end

    assert_redirected_to nbaplayer_path(assigns(:nbaplayer))
  end

  test "should show nbaplayer" do
    get :show, id: @nbaplayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nbaplayer
    assert_response :success
  end

  test "should update nbaplayer" do
    patch :update, id: @nbaplayer, nbaplayer: { avgfanduelpoints: @nbaplayer.avgfanduelpoints, is_starting_lineup: @nbaplayer.is_starting_lineup, name: @nbaplayer.name, position: @nbaplayer.position, team: @nbaplayer.team }
    assert_redirected_to nbaplayer_path(assigns(:nbaplayer))
  end

  test "should destroy nbaplayer" do
    assert_difference('Nbaplayer.count', -1) do
      delete :destroy, id: @nbaplayer
    end

    assert_redirected_to nbaplayers_path
  end
end
