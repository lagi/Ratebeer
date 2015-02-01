class User < ActiveRecord::Base
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4 }
  validates_format_of :password, :with => /\A(?=.*[A-Z])(?=.*[0-9]).+\z/
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :beerclubs, through: :membership
  has_secure_password
  include RatingAverage

  def ratings_count
    array = ratings.to_a
    array.length
  end

end
