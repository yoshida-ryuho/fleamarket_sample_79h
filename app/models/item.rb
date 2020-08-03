class Item < ApplicationRecord
  # has_many :comments, dependent: -destroy-belongs_to :user
  has_many :favorites
  has_many :images, dependent: :destroy
  has_one :evaluation
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref
end