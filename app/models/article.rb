# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  english     :text
#  phonetic    :text
#  created_at  :datetime
#  updated_at  :datetime
#  picture     :string
#  language_id :integer
#  tsv_data    :tsvector
#  category_id :integer
#  state       :string           default("draft")
#

class Article < ActiveRecord::Base
  include PgSearch
  include AASM

  belongs_to :language
  belongs_to :category

  # default order when calling the Article model
  default_scope -> { order('created_at DESC') }

  # CarrierWave integration for uploading pictures
  mount_uploader :picture, PictureUploader

  #validates_presence_of :picture
  validates :picture, presence: true

  # PgSearch
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

  # AASM
  aasm column: :state do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end
end
