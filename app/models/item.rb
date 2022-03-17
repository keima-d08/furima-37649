class Item < ApplicationRecord

  validates :name,             presence: true
  validates :ontent,           presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :postage_id,       presence: true
  validates :prefecture_id,    presence: true
  validates :days_to_ship_id,  presence: true
  validates :price,            presence: true
end
