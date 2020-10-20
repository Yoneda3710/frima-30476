class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname,            presence: true
  validates :email,               uniqueness: true
  validates :password,            format: { with: PASSWORD_REGEX }, length: { minimum: 6 }, confirmation: true
  validates :family_name,         presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  validates :first_name,          presence: true, format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  validates :kana_family_name,    presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー]+\z/ }
  validates :kana_first_name,     presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー]+\z/ }
  validates :birthday,            presence: true

end
