FactoryBot.define do
	# We can set the aliases (nicknames) to a factory like this:
	factory :customer, aliases: [:user, :father] do

		# Transient attributes, or transitory or temporary, attribute invisible to attributes_for.
		transient do
			upcased false 
		end
	
		name { Faker::Name.name }
		
		email { Faker::Internet.email }

		vip true
		
		days_to_pay 30

		# Using traits and factories together
		trait :male do
			gender 'M'
		end

		trait :female do
			gender 'F'
		end

		trait :vip do
			vip true
			days_to_pay 30
		end

		trait :default do
			vip false
			days_to_pay 15
		end

		factory :customer_male, traits: [:male]
		factory :customer_female, traits: [:female]

		factory :customer_default, traits: [:default]
		factory :customer_vip, traits: [:vip]

		factory :customer_male_default, traits: [:male, :default]
		factory :customer_male_vip, traits: [:male, :vip]

		factory :customer_female_default, traits: [:female, :default]
		factory :customer_female_vip, traits: [:female, :vip]

		# Using heritage with factories
		# factory :customer_default do
		# 	vip false
		# 	days_to_pay 15
		# end

		# factory :customer_vip do
		# 	vip true
		# 	days_to_pay 30
		# end

		# After create customer, if evaluator.upcased is true, the name of customer will be upcased.
		after(:create) do |customer, evaluator|
			customer.name.upcase! if evaluator.upcased
		end
	end
end