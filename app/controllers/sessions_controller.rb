class SessionsController < ApplicationController
    def new

    end
    def create
       @user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:email_or_username])
    
       if @user && user.authenticate(params[:password])
     
           session[:user_id] = @user.id
           redirect_to users_path
       else
           flash.now[:alert] = "Log in failed..."
           render :new
       end
    end
    def destroy
        session[:user_id] = nil
        redirect_to movies_url, notice: "Logged out!"
    end

end

# user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:email_or_username])
# if user && user.authenticate(params[:password])
#     session[:user_id] = user.id
#     redirect_to movies_url, notice: "Welcome Back"
# else
#   flash.now[:notice] = "Invalid email/password"
#   render :new
# end