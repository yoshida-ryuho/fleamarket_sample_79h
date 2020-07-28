class Destination < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :pref
end
