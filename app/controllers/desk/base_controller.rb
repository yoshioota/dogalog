class Desk::BaseController < ApplicationController

  layout 'desk_layout'

  before_action :authenticate_desk_user!

end
