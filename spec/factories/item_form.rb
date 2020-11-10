FactoryBot.define do
  factory :item_form do
    token {"tok_abcdefghijk00000000000000000"}
    postalcode {"111-1111"}
    area_id {2}
    municipality {"市区町村"}
    address {"番地"}
    building {"建物"}
    phone { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    association :item
    association :user
  end
end