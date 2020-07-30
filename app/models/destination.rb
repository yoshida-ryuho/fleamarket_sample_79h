class Destination < ApplicationRecord
  belongs_to :user,optional:true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref

  validates :destination_family_name,:destination_first_name,:destination_family_name_kana,:destination_first_name_kana,:post_code,:pref,:city,:house_number,:building_name,:phone_number, presence: true
end
