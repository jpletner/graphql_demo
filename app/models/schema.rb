UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'Our amazing Users'

  field :id, !types.String
  field :email, !types.String
  field :first_name, !types.String
  field :last_name, !types.String
  field :pets, !types[PetType]
end

PetType = GraphQL::ObjectType.define do
  name 'Pet'
  description "Our users' pets"

  field :id, !types.String
  field :name, !types.String
  field :species, !types.String
  field :age, !types.String
  field :breed, !types.String
end

QueryRoot = GraphQL::ObjectType.define do
  name 'Query'
  description '...'

  field :user do
    type UserType
    argument :id, !types.String
    resolve -> (root, args, ctx) {
      User.find(args[:id])
    }
  end
end

Schema = GraphQL::Schema.new(
  query: QueryRoot
)
