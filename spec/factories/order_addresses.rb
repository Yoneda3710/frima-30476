FactoryBot.define do
  factory :order_address do
    token                {"token_sample"} 
    postal_code          {"644-0032"}
    municipality         {"神戸市"}
    address              {Faker::Address.street_address}
    phone_number         {"48483884848"}
    prefecture_id {2}
    association :item
    association :user
  end
end
