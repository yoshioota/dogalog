class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include BasicAuthConcern
  include SimpleBreadcrumbs

  # 例外が出た場合ロールバックする。
  around_action :wrap_transaction, only: [:create, :update, :destroy]

  private

  def wrap_transaction
    ActiveRecord::Base.transaction do
      yield
    end
  end
end
