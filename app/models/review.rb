class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  scope :by_movie, ->(movie){ where(movie_id: movie) }

  scope :in_public, ->{ where(in_public: true) }

  validates :rating, presence: true

end
