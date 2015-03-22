require 'rails_helper'

feature '動画一覧ページ' do

  scenario '表示の確認', js: true do

    visit '/movies'

    create(:movie, title: 'ゴーストバスターズ', description: 'マシュマロマンが出てくる')

    visit '/movies'

    expect(page).to have_content 'ゴーストバスターズ'

    # 詳細を表示
    click_link 'ゴーストバスターズ'

    click_link 'レビューする'

    expect(page.current_path).to eq('/users/sign_in')
  end
end
