module Auth
  extend ActiveSupport::Concern

  included do
    before_action :authorize_request
  end

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    decoded = JsonWebToken.decode(token)

    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render_error(
        message: "Unathorized",
        statusCode: :unauthorized
      )
    end
  rescue
    render_error(
      message: "Unathorized",
      statusCode: :unauthorized
    )
  end
end
