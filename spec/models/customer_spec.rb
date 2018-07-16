require 'rails_helper'

RSpec.describe Customer, type: :model do
	context 'Customer' do

		it 'Using attributes_for' do
			attrs = attributes_for(:customer)
			customer = create(:customer)
			expect(customer.full_name).to start_with("Sr. ")
		end

		it 'Overwriting attributes in a factory' do
			customer = create(:customer, name: 'Diego Novais')
			expect(customer.full_name).to eq("Sr. Diego Novais")
		end
		
		it 'Factory with heritage or nested factories' do
			customer = create(:customer_vip)
			expect(customer.vip?).to be_truthy
		end
		
		it 'Factory with herigate or nested factories' do
			customer = create(:customer_default)
			expect(customer.vip?).to be_falsey
		end

		it 'Overwriting attributes in a factory' do
			customer = create(:customer, name: 'Diego Novais')
			expect(customer.full_name).to eq("Sr. Diego Novais")
		end

		it '#full_name' do
			customer = create(:customer)
			expect(customer.full_name).to start_with("Sr. ")
		end

		it 'Using transiente attributes' do
			customer = create(:customer_default, upcased: true)
			expect(customer.name.upcase).to eq(customer.name)
		end

		it 'Using Trait like attribute' do
			customer = create(:customer_vip, :male)
			expect(customer.gender).to eq('M')
		end

		it 'Using Traits and factories together - customer male' do
			customer = create(:customer_male)
			expect(customer.gender).to eq('M')
		end

		it 'Using Traits and factories together - customer male and default' do
			customer = create(:customer_male_default)
			expect(customer.vip).to eq(false)
		end

		it 'Using Traits and factories together - customer male and vip' do
			customer = create(:customer_male_vip)
			expect(customer.vip).to eq(true)
		end

		it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1)}
	end
end
