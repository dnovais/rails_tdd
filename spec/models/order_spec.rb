require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has 1 order' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Have 3 orders' do
    # Using create_list
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end
end
