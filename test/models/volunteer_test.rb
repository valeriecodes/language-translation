# == Schema Information
#
# Table name: volunteers
#
#  id         :integer          not null, primary key
#  vname      :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save volunteer without its field vname" do
     volunteer = Volunteer.new
     assert_not volunteer.save, "Saved the volunteer without its vname"
   end
end
