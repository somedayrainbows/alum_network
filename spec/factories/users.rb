FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    admin { false }
    role { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    cohort { "MyString" }
  end
end
