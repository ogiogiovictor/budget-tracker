require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    User.destroy_all
    Category.destroy_all
    Expense.destroy_all

    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user: @user)
    @expense = FactoryBot.create(:expense, user: @user, category: @category)
  end

  it 'has valid attributes' do
    expect(@expense).to be_valid
  end
end
