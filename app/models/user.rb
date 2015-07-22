# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  username               :string
#  location               :string
#  contact                :string
#  gender                 :string
#  lang                   :string
#  tsv_data               :tsvector
#  authentication_token   :string
#  login_approval_at      :datetime
#  organization_id        :integer
#

class User < ActiveRecord::Base
  rolify
  include PgSearch

  belongs_to :organization
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :token_authenticatable

  default_scope -> { order('created_at DESC') }
  validates_uniqueness_of :username
  validates_confirmation_of :password, length: { in: 6..20 }
  validates_presence_of :username, :email, :first_name, :last_name, :organization_id

  before_save :ensure_authentication_token

  # Search 
  pg_search_scope :user_search,
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
