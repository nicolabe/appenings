require 'test_helper'

class AppeningsControllerTest < ActionController::TestCase
  setup do
    @appening = appenings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appenings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appening" do
    assert_difference('Appening.count') do
      post :create, appening: { body: @appening.body, title: @appening.title }
    end

    assert_redirected_to appening_path(assigns(:appening))
  end

  test "should show appening" do
    get :show, id: @appening
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appening
    assert_response :success
  end

  test "should update appening" do
    put :update, id: @appening, appening: { body: @appening.body, title: @appening.title }
    assert_redirected_to appening_path(assigns(:appening))
  end

  test "should destroy appening" do
    assert_difference('Appening.count', -1) do
      delete :destroy, id: @appening
    end

    assert_redirected_to appenings_path
  end
end
