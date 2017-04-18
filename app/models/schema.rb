PetType = GraphQL::ObjectType.define do
  name 'Pet'
  description "A users' pets"

  field :id, !types.String
  field :species, !types.String
  field :age, !types.String
  field :breed, !types.String
  field :color, !types.String
end

UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'Users'

  field :id, !types.String
  field :email, !types.String
  field :first_name, !types.String
  field :last_name, !types.String
  field :pets, !types[PetType]
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
