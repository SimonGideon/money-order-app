require 'rails_helper'

RSpec.describe MoneyOrder, type: :model do
  it { should belong_to(:group) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:description) }
end
