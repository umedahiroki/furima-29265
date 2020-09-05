class Item < ApplicationRecord
    belongs_to :user
    has_one :purchase

    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to_active_hash :status
    belongs_to_active_hash :shopping_datum
    belongs_to_active_hash :origin_area
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :category

    has_one_attached :image

    validates :name, presence: true
    validates :picture,presence: true
    validates :status, presence: true
    validates :delivery_fee, presence: true
    validates :category, presence: true
    validates :origin_area, presence: true
    validates :shopping_datum, presence: true
    validates :price, presence: true,
                      format: { with: /\A[0-9]+\z/ },
                      inclusion: { in: 300..9999999 }              
end

