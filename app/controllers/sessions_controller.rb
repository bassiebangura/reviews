class SessionsController < ApplicationController
    def new

    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user, notice: "Welcome back, #{user.name}!"
        else
          flash.now[:alert] = "Invalid email/password combination!"
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