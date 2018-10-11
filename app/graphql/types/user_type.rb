module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false

    field :books, field: Fields::BooksField
  end
end
