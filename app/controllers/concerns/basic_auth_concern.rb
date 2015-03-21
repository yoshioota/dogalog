module BasicAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :basic_auth_action
  end

  def basic_auth_action
    return true if ENV['ENABLE_BASIC_AUTH'].to_i != 1

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_ID'] &&
      password == ENV['BASIC_AUTH_PASS']
    end
  end

end
