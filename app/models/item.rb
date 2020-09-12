class Item < ApplicationRecord
    belongs_to :user, optional: true
    has_one :order, foreign_key: :item_id, dependent: :destroy 

    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to_active_hash :status
    belongs_to_active_hash :shopping_datum
    belongs_to_active_hash :origin_area
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :category

    has_one_attached :image

    validates :name, presence: true
    validates :image, presence: true
    validates :text,presence: true
    validates :status, presence: true  
    validates :status_id, numericality: { other_than: 1 } 
    validates :delivery_fee, presence: true
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :category, presence: true
    validates :category_id, numericality: { other_than: 1 } 
    validates :origin_area, presence: true
    validates :origin_area_id, numericality: { other_than: 1 } 
    validates :shopping_datum, presence: true
    validates :shopping_datum_id, numericality: { other_than: 1 } 
    validates :price, presence: true,
                      format: { with: /\A[0-9]+\z/ },
                      inclusion: { in: 300..9999999 }              
end

