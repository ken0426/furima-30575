class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, true
  validates :email, true
  validates :encrypted_password, true
  validates :fastname, true
  validates :secondname, true
  validates :fastname_kana, true
  validates :secondname_kana, true
  validates :birthday, true

  has_many :items
  has_many :orders
end
