class User < ActiveRecord::Base
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  has_many :ratings
  has_many :beers, through: :ratings
  has_many :beerclubs
  has_secure_password
  include RatingAverage

  def ratings_count
    array = ratings.to_a
    array.length
  end

end
