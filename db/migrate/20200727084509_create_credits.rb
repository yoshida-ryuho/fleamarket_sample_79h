class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|

      t.timestamps
    end
  end
end
