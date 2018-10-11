module Fields
  module EntryPoint
    BookField = GraphQL::Field.define do
      type Types::BookType

      argument :id, !types.ID

      resolve ->(_obj, args, ctx) do
        ctx[:auth_engine].authenticate!

        book = Book.find_by(id: args[:id])

        ctx[:auth_engine].authorize!(
          policy_class: BookPolicy,
          action: :show?,
          resource: book
        )

        book
      end
    end
  end
end
