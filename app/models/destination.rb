class Destination < ApplicationRecord
  belongs_to :user,optional:true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :pref

  validates :destination_family_name,:destination_first_name, presence: true, format: { with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ａ-ｚＡ-Ｚ])+\z/, message: 'は全角で入力して下さい。'}
  
  validates :destination_family_name_kana,:destination_first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい。'}
  
  validates :post_code, presence: true, format: { with:/\A\d{7}\z/, message: 'はハイフンなし７桁で入力して下さい。'}
  validates :pref_id,:city,:house_number, presence: true
end
