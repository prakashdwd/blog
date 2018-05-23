require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest


  test "It should load post#index" do
	get "/"
	assert_select "h1" , "Blog Posts"
  end

  test "Should create Post" do	
  	get "/posts/new"
  	assert_response :success
  	post "/posts" , params: {post: {title: "Post Title" , body: "Post Body"}}
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	assert_select "h2" , "Post Title"
  end

  test "Should NOT create Post" do  
    get "/posts/new"
    assert_response :success
    post "/posts" , params: {post: {title: "" , body: "Post Body"}}
    assert_response :success
  end

  test "Should update Post" do  
    post = posts(:one)
    get edit_post_url(post)
    assert_response :success
    patch post_url(post) , params: {post: {title: "Edited Title" , body: "Edited Body"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1" , "Edited Title"
  end

  
end
