# == Schema Information
#
# Table name: installations
#
#  id           :integer          not null, primary key
#  installation :string
#  email        :string
#  address      :text
#  contact      :string
#  created_at   :datetime
#  updated_at   :datetime
#

class Installation < ActiveRecord::Base
 has_many :sites , dependent: :destroy
 validates :installation, presence: true
end
