class BuyerDestination
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  VALID_POSTCODE_REGEX = /\A\d{3}-\d{4}$|^\d{3}-\d{2}$|^\d{3}\z/
  VALID_PHONENUMBER_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :postcode, length: { is: 8 }, format: { with: VALID_POSTCODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number, length: { in: 10..11 }, format: { with: VALID_PHONENUMBER_REGEX }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)

    Destination.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                       building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
