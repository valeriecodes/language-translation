# == Schema Information
#
# Table name: countries
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime
#  updated_at      :datetime
#  organization_id :integer
#  user_id         :integer
#

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save country without its field name" do
    country = Country.new
    assert_not country.save, "Saved the country without its name"
  end

end
