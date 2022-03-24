FactoryBot.define do
  factory :buyer_destination do
    postcode                 { '111-1111' }
    prefecture_id            { '2' }
    municipalities           { 'てすと' }
    address                  { 'てすと' }
    phone_number             { '11111111111' }
    token                    { 'tok_abcdefghijk00000000000000000' }
  end
end
