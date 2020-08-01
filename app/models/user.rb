class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :evaluations
  has_many :seller_items, foreign_key: "seller_id", class_name: "items"
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
  # has_one :profile, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :credit, dependent: :destroy  
  
  # accepts_nested_attributes_for :destination

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true } , format: {with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'メールアドレスに@とドメインを含めて下さい'}

  validates :password, presence: true
  
  validates :family_name,:first_name, presence: true, format: { with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[a-zA-Z]|[ａ-ｚＡ-Ｚ])+\z/, message: 'は全角で入力して下さい'}
  
  validates :family_name_kana,:first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/, message: 'は全角ひらがなで入力して下さい'}

  validates :birth_date, presence: true
end