class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user,optional: true
  belongs_to :category
  has_many :favorites
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_one :evaluation
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref

  validates :name, :introduction, :price, :condition, :preparation_day, :postage_burden, presence: true

  
end
