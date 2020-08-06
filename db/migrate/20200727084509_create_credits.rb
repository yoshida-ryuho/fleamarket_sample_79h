class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string :token
      t.references :user_id,null: false, foreign_key: true
      t.integer :customer_id
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
