require 'test_helper'

class TocsControllerTest < ActionController::TestCase
  setup do
    @toc = tocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create toc" do
    assert_difference('Toc.count') do
      post :create, toc: { children_count: @toc.children_count, depth: @toc.depth, lft: @toc.lft, name: @toc.name, outline_id: @toc.outline_id, parent_id: @toc.parent_id, rgt: @toc.rgt }
    end

    assert_redirected_to toc_path(assigns(:toc))
  end

  test "should show toc" do
    get :show, id: @toc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @toc
    assert_response :success
  end

  test "should update toc" do
    patch :update, id: @toc, toc: { children_count: @toc.children_count, depth: @toc.depth, lft: @toc.lft, name: @toc.name, outline_id: @toc.outline_id, parent_id: @toc.parent_id, rgt: @toc.rgt }
    assert_redirected_to toc_path(assigns(:toc))
  end

  test "should destroy toc" do
    assert_difference('Toc.count', -1) do
      delete :destroy, id: @toc
    end

    assert_redirected_to tocs_path
  end
end
