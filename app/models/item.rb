class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled
  has_one_attached :image
  belongs_to :user
  #has_one :deal

  validates :name,           presence: true, length: { maximum: 40 }
  validates :description,    presence: true, length: { maximum: 1000 }
  validates :category_id,    numericality: { other_than: 1 }
  validates :status_id,      numericality: { other_than: 1 }
  validates :shipping_id,    numericality: { other_than: 1 }
  validates :prefecture_id,  numericality: { other_than: 1 }
  validates :scheduled_id,   numericality: { other_than: 1 }
  
end
