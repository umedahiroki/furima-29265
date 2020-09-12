FactoryBot.define do
 
  factory :shopping_order do
    post_code       { 123-4567 }
    prefecture_id   { 6 }
    city            { "横浜" }
    address         { "東横浜" }
    phone_number    { 00011112222 }  
  end
end
