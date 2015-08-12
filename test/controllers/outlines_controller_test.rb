require 'test_helper'

class OutlinesControllerTest < ActionController::TestCase
  setup do
    @outline = outlines(:michigan_outline)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outline" do
    assert_difference('Outline.count') do
      post :create, outline: { content: @outline.content }
    end

    assert_redirected_to outline_path(assigns(:outline))
  end

  test "should show outline" do
    get :show, id: @outline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outline
    assert_response :success
  end

  test "should update outline" do
    patch :update, id: @outline, outline: { content: @outline.content }
    assert_redirected_to outline_path(assigns(:outline))
  end

  test "should destroy outline" do
    assert_difference('Outline.count', -1) do
      delete :destroy, id: @outline
    end

    assert_redirected_to outlines_path
  end
end
