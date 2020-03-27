require 'test_helper'

class SpeakingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speaking = speakings(:one)
  end

  test "should get index" do
    get speakings_url
    assert_response :success
  end

  test "should get new" do
    get new_speaking_url
    assert_response :success
  end

  test "should create speaking" do
    assert_difference('Speaking.count') do
      post speakings_url, params: { speaking: { student_id: @speaking.student_id, title: @speaking.title } }
    end

    assert_redirected_to speaking_url(Speaking.last)
  end

  test "should show speaking" do
    get speaking_url(@speaking)
    assert_response :success
  end

  test "should get edit" do
    get edit_speaking_url(@speaking)
    assert_response :success
  end

  test "should update speaking" do
    patch speaking_url(@speaking), params: { speaking: { student_id: @speaking.student_id, title: @speaking.title } }
    assert_redirected_to speaking_url(@speaking)
  end

  test "should destroy speaking" do
    assert_difference('Speaking.count', -1) do
      delete speaking_url(@speaking)
    end

    assert_redirected_to speakings_url
  end
end
