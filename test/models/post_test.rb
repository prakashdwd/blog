require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
  assert true
  end

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
end
