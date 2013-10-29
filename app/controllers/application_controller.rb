class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :configure_devise_params, if: :devise_controller?
  
  #Devise override for home path
  def after_sign_in_path_for(resource)
    mark_holidays_in_past_as_taken
    absences_path
  end

  unless ["test", "developement"].include? Rails.env
    def handler_exception(exception)
      logger.error(" * Message   : #{exception.message}") unless exception.message.nil?
    end
  end

  private

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:forename, :surname, :user_type_id, :manager_id, :invite_code, :email, :password, :password_confirmation)
    end
  end

  def mark_holidays_in_past_as_taken
    Absence.mark_as_taken current_user
  end

  def authenticate_manager
    redirect_to root_path unless current_user.user_type.name == 'Manager'
  end
end
