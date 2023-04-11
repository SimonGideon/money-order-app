class Group < ApplicationRecord
  belongs_to :users
  has_many :money_orders
end
