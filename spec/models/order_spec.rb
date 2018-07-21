require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has 1 order - Belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Have 3 orders - Using create_list' do
    # Using create_list
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many, transiente attributes, traits, callback after and create_list together' do
    # Call the trait :with_orders to create 3 or more orders.
    customer = create(:customer, :with_orders)

    # We can pass the factory :customer_with_orders rather the example above, like this:
    # customer = create(:customer_with_orders)

    # We can overwrite the transiente attribute :qtd_order like this:
    # customer = create(:customer, :with_orders, qtd_order: 5)
    # and make the expect to customer.orders.count eq 5.
    expect(customer.orders.count).to eq(3)  
  end
end
