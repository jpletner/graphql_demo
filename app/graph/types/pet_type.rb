# app/graph/types/pet_type.rb
PetType = GraphQL::ObjectType.define do
  name "Pet"
  description "User's Pets"
  field :name, types.String
  field :species, types.String
  field :breed, types.String
  field :age, types.String
end
