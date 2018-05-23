require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
   setup do
   	 @post = posts(:one)
   end

   test "Should direct to the index page" do
     get posts_url
     assert_response :success
   end

   test "should show a post" do
	   get post_url(@post)
	   assert_response :success
   end

   test "Should direct to new post page" do
     get "/posts/new"
     assert_response :success
   end

   test "should delete post on destroy" do
     post = posts(:two)
   	 assert_difference('Post.count', -1) do
     	delete post_path(post)
   	 end
	   assert_redirected_to posts_url
   end

   test "Form should show up" do
     get "/posts/new"
     assert_select "form" do |elements|
      elements.each do |element|
        assert_select element , "input" , 3
      end
    end
   end

end
