class ApplicationController < ActionController::Base

    private
    def require_signin
        unless current_user
        session[:return_to] = request.url
        redirect_to signin_path, alert: "You need to sign in first."
        end
    end
    def require_admin
       unless current_user_admin?
            redirect_to root_url, alert: "Unauthorized access!"
       end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_user?(user)
        user == current_user
    end
    def current_user_admin?
        current_user && current_user.admin?
    end
        
    
    helper_method :current_user
    helper_method :current_user?
    helper_method :current_user_admin?
end
