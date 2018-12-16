require 'test_helper'

class SourcesControllerTest < ActionController::TestCase
  setup do
    @source = sources(:zhukov)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source" do
    assert_difference('Source.count') do
      post :create, params: {source: { link: @source.link, label: @source.label }}
    end

    assert_redirected_to source_path(assigns(:source))
  end

  test "should show source" do
    get :show, params: {id: @source}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @source}
    assert_response :success
  end

  test "should update source" do
    patch :update, params: {id: @source, source: { link: @source.link, label: @source.label }}
    assert_redirected_to source_path(assigns(:source))
  end

  test "should destroy source" do
    assert_difference('Source.count', -1) do
      delete :destroy, params: {id: @source}
    end

    assert_redirected_to sources_path
  end
end
