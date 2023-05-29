class ApplicationController < ActionController::API
    # skip_before_action :verify_authenticity_token
    respond_to :json
    include ActionController::MimeResponds
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
            user_params.permit(:email, :password)
        end
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:email, :password, :username, :first_name, :last_name, :admin, :moderator)
        end
    end
end
