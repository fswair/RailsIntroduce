module Api
class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]
    after_action :after_action_method, only: %i[create]
    def create
        @user = User.create(product_params)
        @user.save()
        render json: @user
    end

    def show
        # avatar = rails_blob_url(@user.user_avatar)
        if !@user 
            render json: {"user": nil, errors: "user_not_found"}
        else
            render json: {"user": @user, "category": @user.category}
        end
    end

    def index
        # @user = User.where(id: params["id"])
        @users = User.order(id: params["order_by"] || :asc)
        if !@users.blank?
            @message = "Success"
            render :index, status: :ok
        else
            @message = "No such user on table"
            render :error, status: :bad_request
        end
    end

    def update
        @user.update(product_params)
        render json: @user
    end
    def destroy
        @user.destroy()
        render json: @user
    end

    def ping
        render json: { message: "pong" }, status: :ok
    end

    def set_user
        puts 
        puts "before action method called"
        puts
        begin
            @user = User.find(params[:id])
        rescue
            @user = nil
        end
    end
    private

    def after_action_method
        puts
        puts "after action method called"
        puts
    end

    def product_params
        params.permit(:name, :username, :email_verified, :user_avatar)
    end
end
end