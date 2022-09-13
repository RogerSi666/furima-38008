FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'Test1234' }
    password_confirmation { 'Test1234' }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    kana_first_name       { person.first.katakana }
    kana_last_name        { person.last.katakana }
    birthday              { Faker::Date.birthday }
  end
end
