# == Schema Information
#
# Table name: installations
#
#  id           :integer          not null, primary key
#  installation :string(255)
#  email        :string(255)
#  address      :text
#  contact      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class InstallationTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save installation without its field installation" do
     installation = Installation.new
     assert_not installation.save, "Saved the post without its name"
   end

end
