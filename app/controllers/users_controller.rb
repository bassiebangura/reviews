class UsersController < ApplicationController
   
    before_action :require_signin, expect: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path, notice: "Thanks for signing up!"
        else
            render :new
        end
    end
    def edit
    end
    def update
        if @user.update(user_params)
            redirect_to users_path, notice: "User updated!"
        else
            render :edit
        end
    end
    def destroy
        session[:user_id] = nil
        @user.destroy
        redirect_to movies_url, alert: "User deleted!"
    end
    private
    def require_correct_user
        @user = User.find(params[:id])
        redirect_to users_path, alert: "Access denied." unless current_user?(@user)
    end
    def user_params
        params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end
end
