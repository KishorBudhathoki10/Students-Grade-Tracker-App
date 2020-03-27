require 'test_helper'

class ListeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listening = listenings(:one)
  end

  test "should get index" do
    get listenings_url
    assert_response :success
  end

  test "should get new" do
    get new_listening_url
    assert_response :success
  end

  test "should create listening" do
    assert_difference('Listening.count') do
      post listenings_url, params: { listening: { title: @listening.title } }
    end

    assert_redirected_to listening_url(Listening.last)
  end

  test "should show listening" do
    get listening_url(@listening)
    assert_response :success
  end

  test "should get edit" do
    get edit_listening_url(@listening)
    assert_response :success
  end

  test "should update listening" do
    patch listening_url(@listening), params: { listening: { title: @listening.title } }
    assert_redirected_to listening_url(@listening)
  end

  test "should destroy listening" do
    assert_difference('Listening.count', -1) do
      delete listening_url(@listening)
    end

    assert_redirected_to listenings_url
  end
end
