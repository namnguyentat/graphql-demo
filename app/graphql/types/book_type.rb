module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :created_at, String, null: false, method: :created_at_str do
      def accessible?(context)
        super && context[:auth_engine].current_user.present? && context[:auth_engine].current_user.admin?
      end
    end

    field :user, field: Fields::UserField do
      def visible?(context)
        super &&
          context[:auth_engine].current_user.present? &&
          context[:auth_engine].current_user.admin?
      end
    end
  end
end
