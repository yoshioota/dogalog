class GravatarUtils

  def self.url(email, options = {})
    options = {d: :retro}.merge(options)
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}?#{options.to_query}"
  end
end
