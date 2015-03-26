class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise(
      :database_authenticatable,
      :registerable,
      :recoverable,
      :rememberable,
      :trackable,
      :validatable,
      # confirmable を使うときは confirmation_at 等をコメントアウト
      # まともなサービス作るんだったら99%これ使うので初めから設定すること。
      # 途中から使う場合は $ rails generate devise user を叩いてマイグレーションを作りconfirmation系をコメントアウトすると吉。
      :confirmable,
      # :lockable,
      # :timeoutable,
      # :omniauthable
  )

  has_many :movies, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :display_name, presence: true, length: {maximum: 50}

  def profile_thumbnail_url
    GravatarUtils.url(self.email, {s: 16})
  end

  def profile_url
    GravatarUtils.url(self.email)
  end

  def image_tag_and_name
    "#{ActionController::Base.helpers.image_tag(self.profile_thumbnail_url, width: 16, height: 16)} #{self.display_name}".html_safe
  end
end
