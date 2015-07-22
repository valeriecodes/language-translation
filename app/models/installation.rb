# == Schema Information
#
# Table name: installations
#
#  id              :integer          not null, primary key
#  installation    :string
#  email           :string
#  address         :text
#  contact         :string
#  created_at      :datetime
#  updated_at      :datetime
#  organization_id :integer
#

class Installation < ActiveRecord::Base
 belongs_to :organization
 has_many :sites, dependent: :destroy
 validates_presence_of :installation, :organization_id
end
