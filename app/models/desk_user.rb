class DeskUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
      :database_authenticatable,
      # :registerable,
      # :recoverable,
      :rememberable,
      :trackable,
      :validatable
  )

  def profile_thumbnail_url
    GravatarUtils.url(self.email, {s: 16})
  end

  def image_tag_and_email
    "#{ActionController::Base.helpers.image_tag(profile_thumbnail_url, width: 16, height: 16)} #{email}".html_safe
  end

end
