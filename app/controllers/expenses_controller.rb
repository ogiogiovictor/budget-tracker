class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: %i[show edit update destroy]

  def index; end

  def new
    @expense = Expense.new
    @categories = Category.where(user_id: current_user.id).order(:name)
  end

  def show
    @expense = Expense.find(params[:id])
    @categories = @expense.category
  end

  def create
    @expense = Expense.new(expense_params)
    @categories = Category.where(user_id: current_user.id).order(:name)
    @expense.user_id = current_user.id
    if @expense.save
      # redirect_to categories_path
      redirect_to category_path(@expense.category_id)
    else
      render template: 'expenses/new'
      # render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      redirect_to @expense
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path
  end

  private

  def expense_params
    # params.require(:expense).permit(:name, :amount, :date_of_expense, categories: []) //Multiple Cat
    params.require(:expense).permit(:name, :amount, :date_of_expense, :category_id)
  end

  def set_blog
    @expense = Expense.find(params[:id])
    @categories = Category.where(user_id: current_user.id).order(:name)
  end
end
