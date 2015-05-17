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

class Contributor < ActiveRecord::Base
  belongs_to :site
  validates :name, presence: true
end
