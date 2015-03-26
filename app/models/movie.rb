class Movie < ActiveRecord::Base

  belongs_to :user

  has_many :reviews, dependent: :destroy

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

  def thumbnail_url
    return '' if self.video_id.blank?

    # http://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api
    "http://img.youtube.com/vi/#{video_id}/mqdefault.jpg"
  end
end
