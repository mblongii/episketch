require 'test_helper'

class DesignersControllerTest < ActionController::TestCase
  setup do
    @designer = designers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:designers)
  end

  test "should create designer" do
    assert_difference('Designer.count') do
      post :create, designer: { auth_token: @designer.auth_token, avatar_url: @designer.avatar_url, email: @designer.email, storyboard_id: @designer.storyboard_id, viewing_storyboard_id: @designer.viewing_storyboard_id }
    end

    assert_response 201
  end

  test "should show designer" do
    get :show, id: @designer
    assert_response :success
  end

  test "should update designer" do
    put :update, id: @designer, designer: { auth_token: @designer.auth_token, avatar_url: @designer.avatar_url, email: @designer.email, storyboard_id: @designer.storyboard_id, viewing_storyboard_id: @designer.viewing_storyboard_id }
    assert_response 204
  end

  test "should destroy designer" do
    assert_difference('Designer.count', -1) do
      delete :destroy, id: @designer
    end

    assert_response 204
  end
end
