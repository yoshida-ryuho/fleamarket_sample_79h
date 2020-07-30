class Destination < ApplicationRecord
  belongs_to :user,optional:true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref

  validates :destination_family_name,:destination_first_name,:post_code,:pref_id,:city,:house_number, presence: true
  
  validates :destination_family_name_kana,:destination_first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい。'}
end
