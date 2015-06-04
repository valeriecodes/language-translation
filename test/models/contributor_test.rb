# == Schema Information
#
# Table name: contributors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save contributor without its field name" do
     contributor = Contributor.new
     assert_not contributor.save, "Saved the contributor without its name"
   end
end
