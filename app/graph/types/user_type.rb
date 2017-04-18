# app/graph/types/user_type.rb
UserType = GraphQL::ObjectType.define do
  name "User"
  description "A User"
  field :first_name, types.String
  field :last_name, types.String
  field :email, types.String
  field :pets do
    type PetType
    resolve -> (obj, args, ctx) {
      obj.pets
    }
  end
end
