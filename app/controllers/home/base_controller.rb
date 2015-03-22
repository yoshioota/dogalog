class Home::BaseController < AuthorizedController

  before_action do
    add_breadcrumb 'Home', home_path
  end
end
