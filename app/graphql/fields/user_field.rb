module Fields
  UserField = GraphQL::Field.define do
    type Types::UserType

    resolve ->(obj, _args, _ctx) do
      RecordLoader.for(User).load(obj.user_id)
    end
  end
end
