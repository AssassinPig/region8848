require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get notes" do
    get :notes
    assert_response :success
  end

  test "should get passages" do
    get :passages
    assert_response :success
  end

  test "should get about_me" do
    get :about_me
    assert_response :success
  end

end
