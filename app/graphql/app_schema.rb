class AppSchema < GraphQL::Schema
  use GraphQL::Batch

  query Types::QueryType
  mutation Types::MutationType

  lazy_resolve(Promise, :sync)

  max_depth 20
  max_complexity 300
  default_max_page_size 15

  rescue_from StandardError, &:message
end
