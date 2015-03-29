# 例外が出た場合ロールバックする。

module WrapTransaction
  extend ActiveSupport::Concern

  included do
    around_action :wrap_transaction, only: [:create, :update, :destroy]
  end

  private

  def wrap_transaction
    ActiveRecord::Base.transaction do
      yield
    end
  end

end
