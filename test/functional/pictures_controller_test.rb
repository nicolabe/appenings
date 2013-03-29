require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

end
