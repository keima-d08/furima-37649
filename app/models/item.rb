class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship


  validates :name,             presence: true, length: { maximum: 40 }
  validates :content,          presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :status_id,        presence: true, numericality: { other_than: 1 }
  validates :postage_id,       presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates :days_to_ship_id,  presence: true, numericality: { other_than: 1 }
  validates :price,            presence: true, format: { with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image,            presence: true

  belongs_to :user
  has_one_attached :image
end
