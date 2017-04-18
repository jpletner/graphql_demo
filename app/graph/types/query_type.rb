# app/graph/types/query_type.rb
QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :user do
    type UserType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      User.find(args[:id])
    }
  end
end

# The proc takes 3 arguments, the obj (The query in that case),
# args which you will be able to pass in when you query, and context,
# a dict where you can pass any variables you might want to use on resolve time.
