class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 70 }
  has_many :groups
  has_many :money_orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
end
