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
  validates :price,          presence: true, if: :fair_price?, format:{ with:/A[0-9]+Z/}
  validates :image,          presence: true
  validates :category_id,    presence: true,numericality: { other_than: 1 }
  validates :status_id,      presence: true,numericality: { other_than: 1 }
  validates :shipping_id,    presence: true,numericality: { other_than: 1 }
  validates :prefecture_id,  presence: true,numericality: { other_than: 1 }
  validates :scheduled_id,   presence: true,numericality: { other_than: 1 }

  def fair_price?
    price > 300 && price < 99999999
  end
end
