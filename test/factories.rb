FactoryGirl.define do

  factory :user do 
    sequence(:email)          { |n| "test_user_#{n}@gmail.com" }
    sequence(:first_name)     { |n| "Sherlock #{n}" }
    sequence(:last_name)      { |n| "Holmes #{n}" }
    password                  "testing123"
    authentication_token      { Devise.friendly_token }
    sequence(:username)       { |n| "uname_#{n}" }
    login_approval            { "Yes" }
  end

  factory :article do
    sequence(:english)        { |n| "English Text #{n}" }
    sequence(:phonetic)       { |n| "Phonetic Text #{n}" }
    category                  "sample"
  end

end
