class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  scope :by_movie, ->(movie){ where(movie_id: movie) }

  scope :in_public, ->{ where(in_public: true) }

  validates :title,
      presence: true,
      length: {maximum: 255}

  validates :description,
      length: {maximum: 100000}

  validates :rating,
      presence: true,
      inclusion: {in: 0..10}
end
