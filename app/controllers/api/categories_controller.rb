module Api

class CategoriesController < ApplicationController
   before_action :set_category, only: %i[update]
    def create
        @category = Category.create(category_params)
        if @category.valid?
            @category.save
            render json: @category
        else 
            render json: {"errors": @category.errors.full_messages}, status: :bad_request
        end
    end

    def update
        @category.update(category_params)
        render json: @category
    end

    def show
        render json: Category.find(params[:id])
    end

    def index
        @categories = Category.order(id: :desc)
        render json: {"endpoint": :index, "data": @categories}
    end

    def category_params
        params.permit(:name, :parent, :endpoint)
    end

    def set_category
        @category = Category.find(params[:id])
    end
end
end