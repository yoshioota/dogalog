require 'rails_helper'

feature 'Welcomeページ' do

  scenario '未ログイン時', js: true do
    visit '/'
  end

  scenario 'ログイン時', js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
  end
end
