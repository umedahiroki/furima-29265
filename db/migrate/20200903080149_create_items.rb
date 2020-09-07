class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.integer    :price,              null: false
      t.text       :text,               null: false   
      t.references :user,               null: false, foreign_key: true
      t.integer    :status_id,          null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :category_id,        null: false
      t.integer    :origin_area_id,     null: false
      t.integer    :shopping_datum_id,  null: false
      
      t.timestamps
    end
  end
end
