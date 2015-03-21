require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'GET #index' do
    it 'assigns all movies as @movies' do
      movie = FactoryGirl.create(:movie)
      get :index, {}
      expect(assigns(:movies)).to eq([movie])
    end
  end

end
