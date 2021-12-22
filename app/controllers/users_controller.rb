class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        #if current_user
            render json: current_user, status: :ok
        #else
        #    render json: "No current user session is stored", status: :unauthorized
        #end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
