require 'rails_helper'

feature 'Homeページ' do

  scenario '正常に表示できる', js: true do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/home'
    expect(page).to have_content 'Home'

    # capybara のdebug機能
    # [参考] https://github.com/jnicklas/capybara#debugging
    if false
      save_and_open_page
      save_and_open_screenshot
      print page.html
    end
  end
end
