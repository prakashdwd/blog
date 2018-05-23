require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
   test "the truth" do
     assert true
   end

   test "Should direct to the index page" do
     get posts_url
     assert_response :success
   end

end
