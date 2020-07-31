class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :brand,null: false, foreign_key: true
      t.integer :seller_id,null: false, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.string :name,null: false
      t.text :introduction,null: false
      t.integer :price,null: false
      t.string :condition,null: false
      t.string :delivery,null: false
      t.integer :pref_id,null: false
      t.string :preparation_day,null: false
      t.string :category,null: false
      t.string :postage_burden,null: false
      t.timestamps
    end
  end
end
