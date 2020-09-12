class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :items, foreign_key: :user_id, dependent: :destroy
  has_many :orders, foreign_key: :user_id, dependent: :destroy
  

  validates :nicknmame, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password,presence: true,
                      length: { minimum: 6 },
                      format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :first_name_kanji, presence: true, 
                               format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kanji, presence: true,
                              format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_katakana, presence: true, 
                                  format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_katakana, presence: true,
                                 format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
end
