class AddRateToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :birth_date, :date
    remove_column :profiles, :birth_year, :date
    remove_column :profiles, :birth_month, :date
    remove_column :profiles, :birth_day, :date
  end
end
