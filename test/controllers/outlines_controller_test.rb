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
      post :create, params: {outline: { text: @outline.text }}
    end

    assert_redirected_to outline_path(assigns(:outline))
  end

  test "should show outline" do
    get :show, params: {id: @outline}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @outline}
    assert_response :success
  end

  test "should update outline" do
    patch :update, params: {id: @outline, outline: { text: @outline.text }}
    assert_redirected_to outline_path(assigns(:outline))
  end

  test "should destroy outline" do
    assert_difference('Outline.count', -1) do
      delete :destroy, params: {id: @outline}
    end

    assert_redirected_to outlines_path
  end
end
