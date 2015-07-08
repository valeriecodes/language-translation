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

   it "is invalid without a :language_id" do
     article = build(:article, language_id: nil, phonetic: "Cta")
     assert_not article.save, "Saved the article without a english"
   end

   it "is invalid without saving article :picture value" do 
     article = build(:article, english: "Cat", phonetic: "Tac", language_id: 1, picture: nil)
     assert_not article.save, "Saved the article without a phonetic"
   end

   it "is saved with :english and :phonetic value" do
     article = build(:article, {
       english: "Cat", 
       phonetic: "Tac",
       language_id: 1,
       picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'picture', 'logo.jpg'))
     })

     assert article.save, "Saved the article without a phonetic and english value"
   end

end
