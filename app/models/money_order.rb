class MoneyOrder < ApplicationRecord
  has_many :groups
  belongs_to :users
end
