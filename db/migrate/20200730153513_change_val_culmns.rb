class ChangeValCulmns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :nickname, false
    change_column_null :users, :family_name, false
    change_column_null :users, :first_name, false
    change_column_null :users, :family_name_kana, false
    change_column_null :users, :first_name_kana, false
    change_column_null :users, :birth_date, false
    change_column_null :destinations, :phone_number, true
  end
end
