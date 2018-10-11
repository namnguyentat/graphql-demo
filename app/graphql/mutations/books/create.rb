module Mutations::Books
  class Create < Mutations::BaseMutation
    graphql_name 'CreateBook'

    argument :title, String, required: true
    argument :content, String, required: true

    field :book, Types::BookType, null: true
    field :code, Int, null: false
    field :errors, [String], null: true

    def resolve(params)
      context[:auth_engine].authenticate!
      context[:auth_engine].authorize!(
        policy_class: BookPolicy,
        action: :create?
      )

      book = Book.new(
        title: params[:title],
        content: params[:content],
        user: context[:auth_engine].current_user
      )

      if book.save
        {
          book: book,
          code: 201,
          errors: []
        }
      else
        {
          book: nil,
          code: 422,
          errors: book.errors.full_messages
        }
      end
    end
  end
end
