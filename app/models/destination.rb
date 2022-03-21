class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  validates :postcode,          presence: true
  validates :prefecture_id,     presence: true
  validates :municipalities,    presence: true
  validates :address,           presence: true
  validates :building_name
  validates :phone_number,      presence: true

  belongs_to :buyer

  
end
