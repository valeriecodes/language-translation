# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Language < ActiveRecord::Base
 has_many :articles, dependent: :destroy
 validates :name, presence: true
end
