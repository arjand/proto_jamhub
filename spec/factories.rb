GENRES = ["Science Fiction","Fantasy","Literature","Mystery","Flash Fiction"]

FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "email#{n}"}
    password "gobbledygook1"
    password_confirmation "gobbledygook1"
    jam_name "kilroy"
  end
  
  factory :song do
    title 'the greatest song ever'
  end

  factory :genre do
    sequence(:name) {|n| "unique genre#{n}" }
  end

  factory :track do
    title 'the greatest song ever - track 1'
    description 'drum solo'
    user_id '1'
    tag '0'
  end
end