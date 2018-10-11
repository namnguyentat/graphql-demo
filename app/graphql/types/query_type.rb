module Types
  class QueryType < Types::BaseObject
    field :book, field: Fields::EntryPoint::BookField
    field :books, field: Fields::EntryPoint::BooksField
  end
end
