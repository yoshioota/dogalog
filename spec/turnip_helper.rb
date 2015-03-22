# spec_helper.rbにおいておくとうまく行かなかったので
# http://qiita.com/chihiroyn/items/83ff9023bf7023c74979

# turnip step - guard file にstepの場所はここなので変更
Dir.glob('spec/acceptance/steps/**/*steps.rb') { |f| load f, true }
