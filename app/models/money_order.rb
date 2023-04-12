class MoneyOrder < ApplicationRecord
  belongs_to :user, optional: true
  has_many :groups
end
