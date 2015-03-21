module SimpleBreadcrumbs
  extend ActiveSupport::Concern

  included do

    before_action do
      @breadcrumbs = []
    end
  end

  def add_breadcrumb(label, link = nil)
    @breadcrumbs << [label, link]
  end

  def add_breadcrumb_top
    add_breadcrumb('TOP', root_path)
  end

end
