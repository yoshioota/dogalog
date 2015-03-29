class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # BASIC認証の設定
  include BasicAuthConcern

  # パンくず対応
  include SimpleBreadcrumbs

  # 更新系は自動でトランザクションを実行
  include WrapTransaction

  layout 'general_layout'

end
