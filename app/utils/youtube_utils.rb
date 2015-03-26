class YoutubeUtils

  def self.normalize_url(url)
    video_id = get_video_id(url)
    "https://www.youtube.com/watch?v=#{video_id}"
  end

  def self.get_video_id(url)
    Addressable::URI.parse(url).query_values['v']
  end
end
