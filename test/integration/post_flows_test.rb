require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  test "It should load post#index" do
	  get "/"
	  assert_response :success
  end
end
