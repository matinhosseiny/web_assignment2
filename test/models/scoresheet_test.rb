require 'test_helper'

class ScoresheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @scoresheet = Scoresheet.new(teamnumber: 1, user_id: @user.id)
  end

  test "should be valid" do
    assert @scoresheet.valid?
  end

  test "user id should be present" do
    @scoresheet.user_id = nil
    assert_not @scoresheet.valid?
  end
end
