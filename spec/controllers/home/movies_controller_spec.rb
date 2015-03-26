require 'rails_helper'

RSpec.describe Home::MoviesController, type: :controller do

  login_user

  describe 'GET #index' do
    it '自分のムービーが取得でき、他人のムービーは表示されない' do
      movie1 = FactoryGirl.create(:movie, user: subject.current_user)
      movie2 = FactoryGirl.create(:movie, user: create(:user))
      get :index, {}
      expect(assigns(:movies)).to eq([movie1])
    end
  end

end
