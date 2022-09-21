class Api::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:user][:login])
    if user.valid_password? params[:user][:password]
      render json: { token: JsonWebToken.encode(user_id: user.id) }
    else
      render json: { errors: ["Invalid email or password"] }
    end
  end
end
