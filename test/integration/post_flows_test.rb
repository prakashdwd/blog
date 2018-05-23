require 'test_helper'

class PostFlowsTest < ActionDispatch::IntegrationTest
  
  setup do
    @post = posts(:one)
  end


  test "It should load post#index" do
	get "/"
	assert_select "h1" , "Blog Posts"
  end

  test "Should create Post" do	
  	get "/posts/new"
  	assert_response :success
  	post "/posts" , params: {post: {title: @post.title , body: @post.body , category_id: @post.category.id}}
  	assert_response :redirect
  	follow_redirect!
  	assert_response :success
  	assert_select "h2" , "one"
  end

  test "Should NOT create Post" do  
    get "/posts/new"
    assert_response :success
    post "/posts" , params: {post: {title: "" , body: "Post Body" }}
    assert_response :success
  end

  test "Should update Post" do  
    post = posts(:two)
    get edit_post_url(post)
    assert_response :success
    patch post_url(post) , params: {post: {title: "Edited Title" , body: "Edited Body" , category_id: posts(:one).category.id}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1" , "Edited Title"
  end

  test "Should NOT update Post" do  
    post = posts(:two)
    get edit_post_url(post)
    assert_response :success
    patch post_url(post) , params: {post: {title: "Edited Title" , body: "Edited Body" , category_id: nil }}    
    assert_response :success
  end

  
end
