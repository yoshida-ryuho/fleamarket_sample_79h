class AddRateToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :family_name, :string
    remove_column :profiles, :first_name, :string
    remove_column :profiles, :family_name_kana, :string
    remove_column :profiles, :first_name_kana, :string
    remove_column :profiles, :birth_date, :date
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :birth_date, :date
  end
end
