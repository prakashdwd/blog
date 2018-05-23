require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  test "Should be invalid without title" do
  	posts(:one).title = nil
  	assert_equal false , posts(:one).valid?
  end

  test "Title should be string" do
  	assert_equal true , posts(:one).title.is_a?(String)
  end

  test "Body should be string" do
    assert_equal true , posts(:one).body.is_a?(String)
  end

  test "Category_id should not be null" do
    posts(:one).category_id = nil
    assert_equal false , posts(:one).valid?
  end

  test "Category_id should NOT be string" do
    posts(:one).category_id = "rer"
    assert_equal false , posts(:one).category.is_a?(Integer)
  end

  test "Category_id should be integer" do
    assert_equal false , posts(:one).category.is_a?(Integer)
  end

end
