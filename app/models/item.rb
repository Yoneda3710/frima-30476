class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  with_options presence: true do
   validates :name,           length: { maximum: 40 }
   validates :description,    length: { maximum: 1000 }
   validates :price,          numericality:{greater_than: 299, less_than: 10000000}, format:{ with:/\A[0-9]+\z/}
   validates :image             
   with_options  numericality: { other_than: 1 } do
     validates :category_id
     validates :status_id
     validates :shipping_id
     validates :prefecture_id
     validates :scheduled_id
   end
  end
end
