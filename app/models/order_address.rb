class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipality, :address, :building, :phone_number, :order_id
  #validates

  def save
  end
  
end

