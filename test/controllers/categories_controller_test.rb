require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:security)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      process :create, method: :post, params: {category: { color: @category.color, description: @category.description, label: @category.label }}
    end

    assert_redirected_to categories_path #(assigns(:category))
  end

  test "should show category" do
    get :show, params: {id: @category}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @category}
    assert_response :success
  end

  test "should update category" do
    process :update, method: :patch, params: {id: @category, category: { color: @category.color, description: @category.description, label: @category.label }}
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      process :destroy, method: :delete, params: {id: @category}
    end

    assert_redirected_to categories_path
  end
end
