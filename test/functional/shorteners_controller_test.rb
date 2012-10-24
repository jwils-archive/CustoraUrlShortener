require 'test_helper'

class ShortenersControllerTest < ActionController::TestCase
  setup do
    @shortener = shorteners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorteners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shortener" do
    assert_difference('Shortener.count') do
      post :create, shortener: { hash: @shortener.hash, password_hash: @shortener.password_hash, url: @shortener.url }
    end

    assert_redirected_to shortener_path(assigns(:shortener))
  end

  test "should show shortener" do
    get :show, id: @shortener
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shortener
    assert_response :success
  end

  test "should update shortener" do
    put :update, id: @shortener, shortener: { hash: @shortener.hash, password_hash: @shortener.password_hash, url: @shortener.url }
    assert_redirected_to shortener_path(assigns(:shortener))
  end

  test "should destroy shortener" do
    assert_difference('Shortener.count', -1) do
      delete :destroy, id: @shortener
    end

    assert_redirected_to shorteners_path
  end
end
