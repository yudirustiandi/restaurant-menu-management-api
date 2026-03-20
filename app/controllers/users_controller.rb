class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [ :login ]

  def login
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      expired_at = 24.hours.from_now
      token = JsonWebToken.encode({ user_id: user.id }, expired_at)
      data = {
        expired_at: expired_at,
        token: token,
        user: {
          id: user.id,
          name: user.name
        }
      }

      render_success(
        message: "Login success",
        payload: data,
        statusCode: :ok
      )
    else
      render_error(
        message: "Invalid username or password",
        statusCode: :unauthorized
      )
    end
  end
end
