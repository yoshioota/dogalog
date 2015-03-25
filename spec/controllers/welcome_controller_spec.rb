require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  # レンダリングしたviewの結果を見たい場合はrender_viewを呼ぶ。
  # https://www.relishapp.com/rspec/rspec-rails/v/2-6/docs/controller-specs/render-views
  # 常に呼ぶことも可能
  # https://www.relishapp.com/rspec/rspec-rails/v/2-6/docs/controller-specs/render-views#render-views-globally
  render_views

  login_user

  describe 'GET #index' do
    it '正常に表示される' do
      get :index, {}
      expect(response).to have_http_status(200)
      expect(response.body).to have_content('動画をレビューするサービスです')
    end

    it 'ログインしている場合は表示名が表示されている' do
      subject.current_user.update(display_name: 'ユーザの表示名ですです')
      get :index, {}
      expect(response.body).to have_content('ユーザの表示名ですです')
    end
  end
end
