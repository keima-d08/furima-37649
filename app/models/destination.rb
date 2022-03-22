class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
  VALID_PHONENUMBER_REGEX =/\A[0-9]+\z/
  
  validates :postcode,          presence: true, length: { maximum: 8 }, format: { with: VALID_POSTCODE_REGEX }
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 }
  validates :municipalities,    presence: true
  validates :address,           presence: true
  validates :building_name
  validates :phone_number,      presence: true, length: { maximum: 11 }, format: { with: VALID_PHONENUMBER_REGEX }
  validates :buyer              presence: true
  belongs_to :buyer

  
end
