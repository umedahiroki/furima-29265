FactoryBot.define do

  factory :item do
    name           { Faker::Name.initials(number: 2) }
    picture        { Faker::Avatar.image }
    text           { 'おはようございます' }
    status_id         { 5 }
    delivery_fee_id   { 6 }
    category_id       { 7 }
    origin_area_id    { 8 } 
    shopping_datum_id { 9 } 
    price             { 300 } 
  end
end
