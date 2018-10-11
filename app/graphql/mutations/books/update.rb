module Mutations::Books
  class Update < Mutations::BaseMutation
    graphql_name 'UpdateBook'

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :content, String, required: true

    field :book, Types::BookType, null: true
    field :code, Int, null: false
    field :errors, [String], null: true

    def resolve(params)
      context[:auth_engine].authenticate!

      book = Book.find_by(id: params[:id])

      context[:auth_engine].authorize!(
        policy_class: BookPolicy,
        resource: book,
        action: :update?
      )

      if book.update(title: params[:title], content: params[:content])
        {
          book: book,
          code: 200,
          errors: []
        }
      else
        {
          book: nil,
          code: 422,
          errors:  book.errors.full_messages
        }
      end
    end
  end
end
