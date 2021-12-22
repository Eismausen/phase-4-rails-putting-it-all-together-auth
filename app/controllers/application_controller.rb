class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid_record
  before_action :authorize

  private

  def rescue_invalid_record(exception)
    #byebug
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize
    #if session[:user_id] == nil
      render json: {errors: ["No authorized user"]}, status: :unauthorized unless session.include? :user_id
    #end
  end
end
