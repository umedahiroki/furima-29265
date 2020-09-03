FactoryBot.define do

  factory :user do
      nicknmame             { Faker::Name.initials(number: 2) }
      email                 { Faker::Internet.free_email }
      password              { Faker::Internet.password(min_length: 6) }
      password_confirmation { password }
      first_name_kanji      { '田中' }
      last_name_kanji       { '次郎' } 
      first_name_katakana   {'タナカ'} 
      last_name_katakana    {'ジロウ'} 
      birthday              { Faker::Date.birthday }
    end
end
