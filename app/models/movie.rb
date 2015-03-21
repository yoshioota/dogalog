class Movie < ActiveRecord::Base

  belongs_to :user

  has_many :reviews

  validates :title, presence: true

end
