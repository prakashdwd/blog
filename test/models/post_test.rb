require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
  assert true
  end

  test "Should be invalid without title" do
  	posts(:one).title = nil
  	assert_equal false , posts(:one).valid?
  end

end
