module Fields
  BooksField = GraphQL::Field.define do
    type Types::BookType.connection_type

    resolve ->(obj, _args, _ctx) do
      OneToManyLoader.for(Book, 'user_id', :id, :DESC).load(obj.id)
    end
  end
end
