class Api::V1::AuthorsController < ApplicationController
  before_action :set_author

  def show
    render_data(nil, AuthorSerializer.new(@author).as_json) if @author
  end

  private

  def set_author
    @author = Author.find_by(id: params[:id])
    render_error_response(t('error.not_found', entity: 'Author')) unless @author
  end

  def render_data(message, data = {})
    render_response(message, :ok, data)
  end

  def render_response(message, code, data = {})
    render json: { responseMessage: message, data: data }, status: code
  end

  def render_error_response(message, data = {})
    render_response(message, :bad_request, data)
  end
end