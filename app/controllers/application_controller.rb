class ApplicationController < ActionController::Base

    private
    def require_sigin
        unless current_user
        session[:return_to] = request.url
        redirect_to signin_path, alert: "You need to sign in first."
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_user?(user)
        user == current_user
    end
        
    
    helper_method :current_user
    helper_method :current_user?
end
