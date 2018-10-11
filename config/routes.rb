Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  # GraphQL
  resources :queries, only: :create

  # GraphiQL
  if Rails.env.development? || Rails.env.test?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/queries'
  end
end
