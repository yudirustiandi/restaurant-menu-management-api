class ApplicationController < ActionController::API
  include Auth

  attr_reader :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  def render_success(message: "Get success", payload: nil, statusCode: :ok)
    render json: BaseResponse.success(
      message: message,
      payload: payload
    ), status: statusCode
  end

  def render_error(message: "Failed", payload: nil, statusCode: :bad_request)
    render json: BaseResponse.error(
      message: message,
      payload: payload
    ), status: statusCode
  end

  def paginate(data)
    paginated = PaginationResponse.paginate(
      page: data.current_page,
      size: data.limit_value,
      total_pages: data.total_pages,
      total_items: data.total_count,
      items: data
    )

    paginated
  end

  private

  def handle_not_found(exception)
    model = exception.model

    render_error(
      message: "#{model} not found",
      statusCode: :not_found
    )
  end

  def handle_record_invalid(exception)
    record = exception.record

    render_error(
      message: "Validation failed",
      payload: record.errors.full_messages,
      statusCode: :unprocessable_entity
    )
  end
end
