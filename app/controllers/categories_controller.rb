class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories;
    end


    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.user_id = current_user.id
        if @category.save
            redirect_to categories_path
        else
            render 'new'
        end
    end


    def show
        @category = Category.find(params[:id])
        @expenses = @category.expenses.where(user_id: current_user.id).order(:created_at)
        @total = @expenses.sum(:amount)
    end

    private

    def category_params
        params.require(:category).permit(:name, :image)
    end

end