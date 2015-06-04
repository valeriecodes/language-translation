# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save language without its field name" do
     language = Language.new
     assert_not language.save, "Saved the language without its name"
   end

end
