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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should save article/photo without any field" do
     article = Article.new
     assert article.save, "Saved the article/photo without any field"
   end

end
