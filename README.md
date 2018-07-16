# Rails with Rspec

Quando vamos criar um projeto em Rails, em que iremos usar outras libs/gems para test, não precisamos do mini-test que é o padrão gerado pelo Rails.

Para isso ignoramos os tests na hora da geração do projeto:

````
rails g rails_tdd -T
````

O T maiúsculo indica que o projeto sera criado sem os testes por padrão.

## Adicionando as Gems necessárias

Precisamos adicionar em nosso Gemfile as seguintes gems:

````
group :development, :test do
  # Rspec to Rails
  gem 'rspec-rails', '~> 3.6'
  # Capybara gem
  gem 'capybara'
end


group :development do
  # This gem is necessary to generate the binary of rspec in folder bin from application. 
  # To get more speed with commands in rspec when we run bin/rspec rather rspec.
  gem 'spring-commands-rspec'
end
````

Vamos entender um pouco sobre essas gems...

- rspec-rails: Cria os arquivos de configuração necessários para que o Rspec funcione em harmonia com o projeto em Rails. Para ela funcionar ela tem como dependencia a gem Capybara.
- capybara:
- spring-commands-rspec: Gem cria o binario para o rspec dentro da pasta bin do projeto. Assim ganhamos mais velocidade ao rodar o comando bin/rspec assim como bin/rails.


#### Adicionando a gem Factory Bot Rails

Nos iremos trabalhar com as "Fábricas de dados", usaremos para isso a gem factory_bot_rails, dentro do grupo development e test.

````
group :development, :test do
  # Rspec to Rails
  gem 'rspec-rails', '~> 3.6'

  # Capybara gem
  gem 'capybara'

  # factory bot (factory girl)
  gem 'factory_bot_rails', '~> 4.0'
end
````

Logo depois adicionaremos no spec/rails_helper.rb a seguinte configuração:

> config.include FactoryBot::Syntax::Methods

Por padrão as factories ficam dentro do diretorio test/factories ou spec/factories, como estamos usando o Rails, entao deveremos criar a pasta factories dentro da pasta spec.

As factories deveram ser um arquivo .rb (ruby) e conter o mesmo nome das entidades a serem criadas as factories.

Um ex. de nossas factories:

````
FactoryBot.define do
  factory :customer do
	  name "Diego"
		email "contato@diegonovais.com.br"
	end
end
````

Para usarmos as factories, podemos usar usando

> build(:nome_da_factory)

O build ele apenas instancia o objeto, atribuir os valores definidos na factory e não salva.

> create(:nome_da_factory)

Ja o create ele ira criar as instancia, atribuir os valores e salvar.

Notamos que para nossa facrica, os dados serão sempre os mesmos que nós passamos, e nós não queremos isso, queremos que seja criado dados aleartórios, ou seja de forma dinâmica. Para isso iremos usar a gem faker dentro do grupo de development e test.

> gem faker

e não podemos esquecer de rodar bundle install ou apenas bundle.

Para usar a gem podemos fazer da seguinte forma em nosso factory para customer:

````
FactoryBot.define do
	factory :customer do
		name Faker::Name.name
		email Faker::Internet.email
	end
end
````

e nosso teste poderia ser:

````
require 'rails_helper'

RSpec.describe Customer, type: :model do
	context 'Customer' do
		it '#full_name' do
			customer = create(:customer)
			expect(customer.full_name).to start_with("Sr. ")
		end		
	end
end
````
