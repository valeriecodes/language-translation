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
  end

  factory :installation do
    installation              "Location"
    sequence(:email)          { |n| "location_user_#{n}@gmail.com" }
    address                   "Location address"
    contact                   "9900 0000 00"
  end

  factory :language do
    name                      "English"
  end

  factory :site do
    name                      "Site Name"
  end

  factory :category do
    name                      "Pet"
  end

end
