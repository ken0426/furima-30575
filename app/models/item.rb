class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates_inclusion_of :price, in:300..9999999
  end
  
  with_options presence: true do
    validates :name, presence: true
    validates :exposition, presence: true
    validates :category, presence: true
    validates :condition, presence: true
    validates :delivery, presence: true
    validates :area, presence: true
    validates :day, presence: true
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end
