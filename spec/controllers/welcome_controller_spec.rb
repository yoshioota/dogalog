require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  # レンダリングしたviewの結果を見たい場合はrender_viewを呼ぶ。
  # https://www.relishapp.com/rspec/rspec-rails/v/2-6/docs/controller-specs/render-views
  # 常に呼ぶことも可能
  # https://www.relishapp.com/rspec/rspec-rails/v/2-6/docs/controller-specs/render-views#render-views-globally
  render_views

  describe 'GET #index' do
    it '正常に表示される' do
      get :index, {}
      expect(response).to have_http_status(200)
      expect(response.body).to include('動画をレビューするサービスです')
    end

    it 'ログインしている場合はメアドが表示されている' do
      user = create(:user)

      get :index, {}
      expect(response).to have_http_status(200)
      expect(response.body).to include('動画をレビューするサービスです')
    end
  end
end
