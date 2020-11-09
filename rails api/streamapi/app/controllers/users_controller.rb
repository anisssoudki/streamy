class UsersController < ApplicationController 
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index 
       @Users = User.all
       render json: @Users
    end



    def show
        render json: @user
    end

    def create
        @user = User.find_or_create_by(user_params)
        if @user.valid?
            render json: @user
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy 
        
        @user.destroy
      if @user.valid? 
        render json: { errors: @user.errors.full_messages }
      end
    end

    private 

    def set_user
        @user = user.find(params[:id]) || User.find_by(params[:email])
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end


end