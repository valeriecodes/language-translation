# == Schema Information
#
# Table name: sites
#
#  id              :integer          not null, primary key
#  name            :string
#  installation_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Site < ActiveRecord::Base
  resourcify
  default_scope -> { order('created_at DESC') }
  belongs_to :installation

  #has_many :volunteers , dependent: :destroy
  #has_many :contributors , dependent: :destroy
  
  validates :name, presence: true
end
