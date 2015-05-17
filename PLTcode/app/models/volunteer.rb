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

class Volunteer < ActiveRecord::Base
  belongs_to :site
  validates :vname, presence: true
end
