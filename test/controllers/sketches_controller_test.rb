require 'test_helper'

class SketchesControllerTest < ActionController::TestCase
  setup do
    @sketch = sketches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sketches)
  end

  test "should create sketch" do
    assert_difference('Sketch.count') do
      post :create, sketch: { designer_id: @sketch.designer_id, storyboard_id: @sketch.storyboard_id, url: @sketch.url }
    end

    assert_response 201
  end

  test "should show sketch" do
    get :show, id: @sketch
    assert_response :success
  end

  test "should update sketch" do
    put :update, id: @sketch, sketch: { designer_id: @sketch.designer_id, storyboard_id: @sketch.storyboard_id, url: @sketch.url }
    assert_response 204
  end

  test "should destroy sketch" do
    assert_difference('Sketch.count', -1) do
      delete :destroy, id: @sketch
    end

    assert_response 204
  end
end
