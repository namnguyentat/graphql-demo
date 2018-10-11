module Types
  class MutationType < Types::BaseObject
    field :CreateBook, mutation: Mutations::Books::Create
    field :UpdateBook, mutation: Mutations::Books::Update
  end
end
