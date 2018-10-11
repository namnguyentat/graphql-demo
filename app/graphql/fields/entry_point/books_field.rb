module Fields
  module EntryPoint
    BooksField = GraphQL::Field.define do
      type Types::BookType.to_list_type

      resolve ->(_obj, _args, ctx) do
        ctx[:auth_engine].authenticate!
        ctx[:auth_engine].authorize!(
          policy_class: BookPolicy,
          action: :index?
        )

        Book.all.order(id: :DESC)
      end
    end
  end
end
