require 'rails_helper'

feature 'Homeページ' do

  scenario '正常に動作する', js: true do
    user = FactoryGirl.create(:user, display_name: 'ユーザーA')
    login_as(user, :scope => :user)

    visit '/home'

    expect(page).to have_content 'Home'
    expect(page).to have_content 'ユーザーA'

    find(:xpath, '/html/body/div[3]/div/div[1]/div/a[1]').click
    expect(page).to have_content 'あなたが登録した動画'
    # save_and_open_page
    # save_and_open_screenshot

    visit '/home'

    find(:xpath, '/html/body/div[3]/div/div[1]/div/a[2]').click
    expect(page).to have_content 'あなたのレビュー'
    # save_and_open_page
    # save_and_open_screenshot

    visit '/home'

    # capybara のdebug機能
    # [参考] https://github.com/jnicklas/capybara#debugging
    if false
      save_and_open_page
      save_and_open_screenshot
      print page.html
    end
  end
end
