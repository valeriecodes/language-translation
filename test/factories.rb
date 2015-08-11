FactoryGirl.define do

  factory :article do
    language
    category
    sequence(:english)        { |n| "English Text #{n}" }
    sequence(:phonetic)       { |n| "Phonetic Text #{n}" }
  end

  factory :category do
    name                      "Pet"
  end

  factory :country do
    organization
    user
    name                      "Location"
  end

  factory :language do
    name                      "English"
  end

  factory :organization do
    sequence(:name) { |n| "test_org_#{n}" }
  end

  factory :site do
    country
    name                      "Site Name"
  end

  factory :user do
    organization
    sequence(:email)          { |n| "test_user_#{n}@gmail.com" }
    sequence(:first_name)     { |n| "Sherlock #{n}" }
    sequence(:last_name)      { |n| "Holmes #{n}" }
    password                  "testing123"
    authentication_token      { Devise.friendly_token }
    sequence(:username)       { |n| "uname_#{n}" }
    login_approval_at         { 2.weeks.ago }
  end

end
