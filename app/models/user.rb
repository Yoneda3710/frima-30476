class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/.freeze
  KANA_NAME_REGEX = /\A[ア-ン゛゜ァ-ォャ-ョー]+\z/.freeze
  with_options presence: true do
   validates :nickname
   validates :birthday
   validates :email,               uniqueness: true
   validates :password,            format: { with: PASSWORD_REGEX }, length: { minimum: 6 }, confirmation: true

   with_options format:{ with: NAME_REGEX } do
    validates :family_name
    validates :first_name
   end
   with_options format:{ with: KANA_NAME_REGEX } do
    validates :kana_family_name
    validates :kana_first_name
   end
  end
end
