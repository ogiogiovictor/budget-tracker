require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe 'Get users Index' do
    it 'Renders the right template index' do
      get '/'
      expect(response).to render_template(:index)
    end
  end
end
