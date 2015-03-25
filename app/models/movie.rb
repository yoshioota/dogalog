class Movie < ActiveRecord::Base

  belongs_to :user

  has_many :reviews, dependent: :destroy

  validates :title, presence: true

end
