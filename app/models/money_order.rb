class MoneyOrder < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :user, optional: true
  has_and_belongs_to_many :groups
end
