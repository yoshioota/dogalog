require 'rails_helper'

feature '設定ページ' do

  let(:user) { FactoryGirl.create(:user, display_name: 'ユーザーA', email: 'test2@example.com', password: 'test2test', password_confirmation: 'test2test') }

  before do
    ActionMailer::Base.deliveries.clear
    login_as(user, :scope => :user)
    visit '/home'
    find(:xpath, '//*[@id="navbar"]/ul[2]/li[2]/a').click # navbarの[設定]をクリック
  end

  scenario 'アカウント設定', js: true do
    expect(find_field('user[display_name]').value).to eq('ユーザーA')
    expect(find_field('user[email]').value).to eq('test2@example.com')

    fill_in 'user[display_name]', with: 'ユーザーB'
    fill_in 'user[email]', with: 'test100@example.com'

    click_button('更新する')

    user.reload
    expect(user.unconfirmed_email).to eq('test100@example.com') # メアド変更したらまずunconfirmed_emailへ入る。
    expect(ActionMailer::Base.deliveries.count).to eq(1) # 変更の旨のメールが送信されている。
  end

  scenario 'パスワード変更', js: true do
    find(:xpath, '/html/body/div[3]/div/div[1]/div/ul/li[2]/a').click

    expect(page).to have_content 'パスワード変更'

    fill_in 'user[current_password]', with: 'test2test'
    fill_in 'user[password]', with: 'bbbbbbb2'
    fill_in 'user[password_confirmation]', with: 'bbbbbbbb'
    click_button('変更する')

    expect(page).to have_content 'パスワード(確認)とパスワードの入力が一致しません。'

    fill_in 'user[current_password]', with: 'test2test'
    fill_in 'user[password]', with: 'cccccccc'
    fill_in 'user[password_confirmation]', with: 'cccccccc'
    click_button('変更する')

    user.reload
    expect(user.valid_password?('cccccccc')).to be_truthy
  end

  scenario '退会すると対象ユーザだけのデータが削除される', js: true do
    find(:xpath, '/html/body/div[3]/div/div[1]/div/ul/li[3]/a').click

    expect(page).to have_content '退会確認'

    # 対象ユーザー movie
    movie = create(:movie, user: user)
    create(:review, movie: movie, user: user)

    # 他のユーザー A
    other_user_a = create(:user)
    other_movie = create(:movie, user: other_user_a)
    create(:review, movie: other_movie, user: other_user_a)

    # 他のユーザー B
    other_user_b = create(:user)
    other_movie = create(:movie, user: other_user_b)
    create(:review, movie: other_movie, user: other_user_b)
    create(:review, movie: other_movie, user: other_user_b)

    click_link_or_button('退会する')

    expect(Movie.count).to eq(2)
    expect(Review.count).to eq(3)
  end

end
