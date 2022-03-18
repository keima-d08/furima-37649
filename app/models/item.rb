class Item < ApplicationRecord

  validates :name,             presence: true, length: { maximum: 40 }
  validates :content,          presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :postage_id,       presence: true
  validates :prefecture_id,    presence: true
  validates :days_to_ship_id,  presence: true
  validates :price,            presence: true
  validates :image,            presence: true

  belongs_to :user
  has_one_attached :image
end
