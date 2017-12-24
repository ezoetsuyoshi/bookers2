require 'test_helper'

class DefControllerTest < ActionDispatch::IntegrationTest
  test "should get favorited_by?(user)" do
    get def_favorited_by?(user)_url
    assert_response :success
  end

end
