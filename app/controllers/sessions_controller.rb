class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: { errors: ["Invalid Username or Password"] }, status: :unauthorized
        end
    end

    def destroy
        #if session[:user_id] != nil
            session.delete :user_id
            head :no_content
        #else
            #render json: { errors: ["Not Authorozed"] }, status: :unauthorized
        #end
    end

end
