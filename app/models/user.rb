class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies
  has_many :reviews

  def profile_thumbnail_url
    GravatarUtils.url(self.email, {s: 16})
  end

  def profile_url
    GravatarUtils.url(self.email)
  end

  def image_tag_and_name
    "#{ActionController::Base.helpers.image_tag(self.profile_thumbnail_url, width: 16, height: 16)} #{self.email}".html_safe
  end
end
