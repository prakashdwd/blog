require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Should be invalid without name" do
  	categories(:cone).name = nil
  	assert_equal false , categories(:cone).valid?
  end

  test "Category name should be string" do
  	assert_equal true , categories(:cone).name.is_a?(String)
  end
end
