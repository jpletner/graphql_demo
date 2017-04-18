Rails.application.routes.draw do
  post '/graphql', to: 'graphql#query'
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
end
