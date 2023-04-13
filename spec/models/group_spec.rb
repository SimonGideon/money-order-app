require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:money_orders) }
  it { should validate_presence_of(:name) }
end
