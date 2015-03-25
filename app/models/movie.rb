class Movie < ActiveRecord::Base

  belongs_to :user

  has_many :reviews, dependent: :destroy

  validates :title,
      presence: true,
      length: {maximum: 255}

  validates :description,
      length: {maximum: 10_000}

  # http://stackoverflow.com/questions/24658657/activerecord-validate-url-if-it-is-present
  validates :url,
      format: { with: URI.regexp },
      allow_blank: true

end
