class QueriesController < ApplicationController
  def create
    result = AppSchema.execute(
      params[:query],
      variables: ensure_hash(params[:variables]),
      context: {
        auth_engine: AuthEngine.new(request: request, current_user: current_user)
      }
    )
    render json: result
  end

  private

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables)
    else
      query_variables.to_unsafe_h
    end
  end
end
