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