require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = Room.new(rommid: "j1", build: "hunt", size: "6")
  end

  test "should be valid" do
    assert @room.valid?
  end
  
  test "room should be present" do
    @room.rommid = "     "
    assert_not @room.valid?
  end
  
  test "build should be present" do
    @room.build = "     "
    assert_not @room.valid?
  end
  
  test "size should be present" do
    @room.size = "     "
    assert_not @room.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_room = @room.dup
    duplicate_room.rommid = @room.rommid.upcase
    @room.save
    assert_not duplicate_room.valid?
  end
end
