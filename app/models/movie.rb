class Movie < ActiveRecord::Base

  belongs_to :user, counter_cache: true

  has_many :reviews, dependent: :destroy

  scope :order_id_desc, -> { order('id DESC') }

  validates :title,
      presence: true,
      length: {maximum: 255}

  validates :description,
      length: {maximum: 10_000}

  validates :url,
      format: { with: %r|\Ahttps?://www\.youtube\.com| },
      allow_blank: true

  def video_id
    return '' if self.url.blank?
    YoutubeUtils.get_video_id(self.url)
  end

  # http://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api
  def thumbnail_url(img_type = 'mqdefault')
    return '' if self.video_id.blank?
    raise img_type.inspect unless img_type.in?(%w|default hqdefault mqdefault sddefault maxresdefault|)

    "http://img.youtube.com/vi/#{video_id}/#{img_type}.jpg"
  end
end
