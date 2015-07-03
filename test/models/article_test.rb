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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   it "is invalid without any field" do
     article = build(:article, english: nil, phonetic: nil)
     assert_not article.save, "Saved the article/photo without any field"
   end

   it "is invalid without a :english" do
     article = build(:article, english: nil, phonetic: "Cta")
     assert_not article.save, "Saved the article without a english"
   end

   it "is invalid without saving article :phonetic value" do 
     article = build(:article, english: "Cat", phonetic: nil)
     assert_not article.save, "Saved the article without a phonetic"
   end

   it "is saved with :english and :phonetic value" do
     article = build(:article, english: "Cat", phonetic: "Tac")
     assert article.save, "Saved the article without a phonetic and english value"
   end

end
