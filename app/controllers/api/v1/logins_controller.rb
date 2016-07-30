module API
  class V1::LoginsController < API::ApplicationController
    skip_before_action :authenticate!, only: :create

    def create
      user = User.find_by(email: login_params[:email])

      if user && user.valid_password?(login_params[:password]) && user.worker?
        render json: user, status: :created
      else
        render json: { user: { errors: "Usuário ou senha inválidos" } }, status: :unauthorized
      end
    end

    private

    def login_params
      params.require(:user).permit(:email, :password)
    end
  end
end
