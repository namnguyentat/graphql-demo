module Types::Input
  GlobalIdInput = GraphQL::ScalarType.define do
    name 'GlobalIdInput'
    description ''

    coerce_input ->(value, _ctx) { SchemaHelper.decode_id(value) }
    coerce_result ->(value, _ctx) { value }
  end
end
