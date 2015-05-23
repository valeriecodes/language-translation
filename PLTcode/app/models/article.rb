# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  english     :text
#  phonetic    :text
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string(255)
#  picture     :string(255)
#  language_id :integer
#

class Article < ActiveRecord::Base
 default_scope -> { order('created_at DESC') }
 belongs_to :language

 mount_uploader :picture, PictureUploader


end
