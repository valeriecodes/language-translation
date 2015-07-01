# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  english     :text
#  phonetic    :text
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string
#  picture     :string
#  language_id :integer
#  tsv_data    :tsvector
#

class Article < ActiveRecord::Base
  include PgSearch

  belongs_to :language

  validates :english, :phonetic, presence: true

  default_scope -> { order('created_at DESC') }

  mount_uploader :picture, PictureUploader

  # Search 
  pg_search_scope :article_search,
    against: :tsv_data,
    using: {
      tsearch: {
        dictionary: 'english',
        any_word: true,
        prefix: true,
        tsvector_column: 'tsv_data'
      }
    }

end
