class Group < ApplicationRecord
  belongs_to :user
  has_many :money_orders
  has_one_attached :icon_attachment
  attr_accessor :icon_data
end
